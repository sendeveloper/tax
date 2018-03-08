var simplemaps_canadamap_mapdata={
  main_settings: {
    //General settings
		width: "responsive", //or 'responsive'
    background_color: "#FFFFFF",
    background_transparent: "yes",
    border_color: "#ffffff",
    popups: "detect",
    
		//State defaults
		state_description: "Click for more info",
    state_color: "#88A4BC",
    state_hover_color: "#008080",
    state_url: "",
    border_size: 1.5,
    all_states_inactive: "no",
    all_states_zoomable: "no",
    
		//Location defaults
		location_description: "Location description",
    location_color: "#FF0067",
    location_opacity: 0.8,
    location_hover_opacity: 1,
    location_url: "",
    location_size: 25,
    location_type: "square",
    location_border_color: "#FFFFFF",
    location_border: 2,
    location_hover_border: 2.5,
    all_locations_inactive: "no",
    all_locations_hidden: "no",
    
		//Label defaults
		label_color: "#d5ddec",
    label_hover_color: "#d5ddec",
    label_size: 22,
    label_font: "Arial",
    hide_labels: "no",
   
		//Zoom settings
		manual_zoom: "no",
    back_image: "no",
    arrow_color: "#cecece",
    arrow_color_border: "#808080",
    initial_back: "no",
    initial_zoom: -1,
    initial_zoom_solo: "no",
    region_opacity: 1,
    region_hover_opacity: 0.6,
    zoom_out_incrementally: "yes",
    zoom_percentage: 0.99,
    zoom_time: 0.5,
    
		//Popup settings
		popup_color: "white",
    popup_opacity: 0.9,
    popup_shadow: 1,
    popup_corners: 5,
    popup_font: "12px/1.5 Verdana, Arial, Helvetica, sans-serif",
    popup_nocss: "no",
    
		//Advanced settings
		div: "map",
    auto_load: "yes",
    rotate: "0",
    url_new_tab: "no",
    images_directory: "default",
    import_labels: "no",
    fade_time: 0.1,
    link_text: "View Website"
  },
  state_specific: {
    AB: {
      name: "Alberta",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/alberta-sales-tax"
    },
    BC: {
      name: "British Columbia",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/british-columbia-sales-tax"
    },
    SK: {
      name: "Saskatchewan",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/saskatchewan-sales-tax"
    },
    MB: {
      name: "Manitoba",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/manitoba-sales-tax"
    },
    ON: {
      name: "Ontario",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/ontario-sales-tax"
    },
    QC: {
      name: "Quebec",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/quebec-sales-tax"
    },
    NB: {
      name: "New Brunswick",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/new-brunswick-sales-tax"
    },
    PE: {
      name: "Prince Edwards Island",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/prince-edward-island-sales-tax"
    },
    NS: {
      name: "Nova Scotia",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/nova-scotia-sales-tax"
    },
    NL: {
      name: "Newfoundland and Labrador",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/newfoundland-labrador-sales-tax"
    },
    NU: {
      name: "Nunavut",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/nunavut-sales-tax"
    },
    NT: {
      name: "Northwest Territories",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/northwest-territories-sales-tax"
    },
    YT: {
      name: "Yukon",
      description: "default",
      color: "default",
      hover_color: "default",
      url: "/yukon-sales-tax"
    }
  },
  locations: {
    // "0": {
    //   name: "Toronto",
    //   lat: 43.653226,
    //   lng: -79.3831843,
    //   color: "default"
    // },
    // "1": {
    //   name: "Halifax",
    //   lat: 44.6488625,
    //   lng: -63.5753196,
    //   color: "default"
    // }
  },
  labels: {
    PE: {
      x: 960,
      y: 814,
      parent_id: "PE",
      pill: "yes",
      width: 65,
    },
    NS: {
      x: 960,
      y: 854,
      parent_id: "NS",
      pill: "yes",
      width: 65,
    },
    AB: {
      x: 232,
      y: 657,
      parent_id: "AB"
    },
    BC: {
      x: 117,
      y: 635,
      parent_id: "BC"
    },
    YT: {
      x: 75,
      y: 440,
      parent_id: "YT"
    },
    NT: {
      x: 225,
      y: 471,
      parent_id: "NT"
    },
    NU: {
      x: 429,
      y: 478,
      parent_id: "NU"
    },
    SK: {
      x: 332,
      y: 670,
      parent_id: "SK"
    },
    MB: {
      x: 430,
      y: 675,
      parent_id: "MB"
    },
    NL: {
      x: 840,
      y: 643,
      parent_id: "NL"
    },
    NB: {
      x: 837,
      y: 798,
      parent_id: "NB"
    },
    ON: {
      x: 552,
      y: 747,
      parent_id: "ON"
    },
    QC: {
      x: 718,
      y: 704,
      parent_id: "QC"
    }
  }
};