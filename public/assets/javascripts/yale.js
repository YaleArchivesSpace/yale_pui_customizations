function YaleSidebar($sidebar) {
    this.$sidebar = $sidebar;

    this.$row = $sidebar.closest('.row');
    // this is crazy.  it should be changed in the core code to "find" based on an ID value.
    this.$content_pane = this.$row.find('> .col-sm-8');

    if (this.$content_pane.length == 0) {
        // only do things if there's a content pane and a sidebar
        this.$sidebar.removeClass('resizable-sidebar');
        return;
    };

    this.$row.addClass('has-resizable-content');

    this.add_handle();
    this.bind_events();
};

(function(exports) {

    function YaleSimpleRenderer(should_link_to_record) {
        this.endpointMarkerTemplate = $('<tr class="end-marker" />');

        this.should_link_to_record = should_link_to_record || false;

        this.rootTemplate = $('<tr> ' +
            '  <td class="no-drag-handle"></td>' +
            '  <td class="title"></td>' +
            '</tr>');


        this.nodeTemplate = $('<tr> ' +
            '  <td class="drag-handle"></td>' +
            '  <td class="title"><span class="indentor"><button class="expandme"><i class="expandme-icon glyphicon glyphicon-plus" /></button></span> </td>' +
            '</tr>');
    }

})(window);
