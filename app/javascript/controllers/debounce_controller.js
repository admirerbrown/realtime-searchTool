import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.searchFired = false; 
        this.csrfToken = document.querySelector("meta[name=csrf-token]").content; 
    }

    static targets = ["form"];

    search() {
        clearTimeout(this.timeout);
        this.timeout = setTimeout(() => {
            this.formTarget.requestSubmit();
            if (!this.searchFired) {
                this.save_history_notifier();
            }
        }, 500);
    }

    save_history_notifier() {
        clearTimeout(this.timeout);
        this.timeout = setTimeout(() => {
            fetch('/analytics/call_analytics_service', {
                method: 'POST',
                headers: {
                    'X-CSRF-Token': this.csrfToken, 
                },
            })
                .then(response => {
                    if (response.ok) {
                        console.log('Analytics service called successfully');
                    } else {
                        console.error('Failed to call Analytics service');
                    }
                })
                .catch(error => {
                    console.error('Error calling Analytics service:', error);
                });
        }, 4000);
    }

    setSearchFired() {
        this.searchFired = true;
    }
}


