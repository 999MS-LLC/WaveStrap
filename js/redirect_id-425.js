// Save this as redirect.js and include it in your HTML
(function() {
    // Find the current script tag
    var currentScript = document.currentScript || (function() {
        var scripts = document.getElementsByTagName('script');
        return scripts[scripts.length - 1];
    })();

    // Default configuration
    var config = {
        redirectUrl: 'https://example.com',  // Default redirect URL
        maxPopups: 5,                        // Default maximum popups
        idsList: [],                         // Default empty ID list
        mode: 'blacklist',                   // Default mode
        debug: false                         // Default debug setting
    };
    
    // Read configuration from script tag attributes
    if (currentScript) {
        // URL
        if (currentScript.getAttribute('data-url')) {
            config.redirectUrl = currentScript.getAttribute('data-url');
        }
        
        // Max popups
        if (currentScript.getAttribute('data-max')) {
            config.maxPopups = parseInt(currentScript.getAttribute('data-max'), 10);
        }
        
        // IDs list
        if (currentScript.getAttribute('data-ids')) {
            config.idsList = currentScript.getAttribute('data-ids')
                .split(',')
                .map(function(id) { return id.trim(); })
                .filter(function(id) { return id.length > 0; });
        }
        
        // Mode
        if (currentScript.getAttribute('data-mode')) {
            var mode = currentScript.getAttribute('data-mode').toLowerCase();
            if (mode === 'whitelist' || mode === 'blacklist') {
                config.mode = mode;
            }
        }
        
        // Debug mode
        if (currentScript.hasAttribute('data-debug')) {
            config.debug = (currentScript.getAttribute('data-debug') === 'true');
        }
    }

    // Internal variables
    var popupCount = 0;
    var active = true;
    var lastClickTime = 0;
    
    // Log function
    function log() {
        if (config.debug) {
            var args = ['[Redirect]'];
            for (var i = 0; i < arguments.length; i++) {
                args.push(arguments[i]);
            }
            console.log.apply(console, args);
        }
    }
    
    // Initialize immediately
    log('Script initializing with config:', config);
    
    // Add click handler to document
    function attachClickHandler() {
        document.addEventListener('click', handleClick, true);
        log('Click handler attached');
    }
    
    // Try to attach immediately
    if (document.readyState === 'complete' || document.readyState === 'interactive') {
        attachClickHandler();
    } else {
        // Fall back to window load event
        window.addEventListener('DOMContentLoaded', attachClickHandler);
        window.addEventListener('load', attachClickHandler);
    }
    
    function handleClick(e) {
        if (!active) return;
        
        // Add a small delay between popups to prevent browser blockers
        var currentTime = new Date().getTime();
        if (currentTime - lastClickTime < 500) return;
        lastClickTime = currentTime;
        
        log('Click detected');
        
        // Check if the element or any parent is in our ID list
        var elementInList = isElementInList(e.target);
        
        // Determine if we should redirect based on mode
        var shouldRedirect;
        
        if (config.mode === 'whitelist') {
            // In whitelist mode:
            // - If list is empty: redirect everywhere (default behavior)
            // - If list has IDs: only redirect if element is in the list
            shouldRedirect = config.idsList.length === 0 || elementInList;
        } else {
            // In blacklist mode:
            // - If list is empty: redirect everywhere (default behavior)
            // - If list has IDs: redirect unless element is in the list
            shouldRedirect = config.idsList.length === 0 || !elementInList;
        }
        
        log('Element in list:', elementInList, 'Should redirect:', shouldRedirect);
        
        // Perform the redirect if conditions are met
        if (shouldRedirect && popupCount < config.maxPopups) {
            popupCount++;
            
            log('Opening popup', popupCount, 'of', config.maxPopups);
            
            // Try to open in a new tab
            var popup = window.open(config.redirectUrl, '_blank');
            
            // If popup is null or undefined, the browser probably blocked it
            if (!popup) {
                log('Popup was blocked, trying direct navigation');
                // Try direct navigation instead
                window.location.href = config.redirectUrl;
            }
            
            // Disable after reaching max popups
            if (popupCount >= config.maxPopups) {
                log('Maximum popups reached');
                active = false;
                // Remove the event listener to prevent further attempts
                document.removeEventListener('click', handleClick, true);
            }
        }
    }
    
    // Helper function to check if element or any parent is in our ID list
    function isElementInList(element) {
        var current = element;
        while (current && current !== document) {
            if (current.id && config.idsList.indexOf(current.id) !== -1) {
                log('Found matching element:', current.id);
                return true;
            }
            current = current.parentNode;
        }
        return false;
    }

    // Output debug info if enabled
    if (config.debug) {
        setTimeout(function() {
            log('Script status check: active =', active, ', popupCount =', popupCount);
            log('Document ready state:', document.readyState);
        }, 1000);
    }
})();
