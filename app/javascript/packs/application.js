// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

(function() {
  window.SocialShareWeChatButton = {
    init: function(opts) {
      var $wDialog;
      if (opts == null) {
        opts = {};
      }
      $wDialog = "<div id='ss-wechat-dialog' class='ss-wechat-dialog'> <div class='wechat-popup-header'> <span>" + opts.header + "</span> <a href='#' onclick='return false;' class='wechat-popup-close'>×</a> </div> <div id='ss-wechat-dialog-qr' class='wechat-dialog-qr'></div> <div class='wechat-popup-footer'> " + opts.footer + " </div> </div>";
      return $("body").append($wDialog);
    },
    bindEvents: function() {
      var $wContainer;
      $wContainer = $("#ss-wechat-dialog");
      return $wContainer.find(".wechat-popup-close").on("click", function(e) {
        return $wContainer.hide();
      });
    },
    qrcode: function(opts) {
      var $wBody, $wContainer, left, top;
      if (opts == null) {
        opts = {};
      }
      if (!$("#ss-wechat-dialog").length) {
        this.init(opts);
        this.bindEvents();
      }
      $wBody = $('#ss-wechat-dialog-qr');
      $wBody.empty();
      $wBody.qrcode({
        width: 200,
        height: 200,
        text: opts.url
      });
      $wContainer = $("#ss-wechat-dialog");
      top = ($(window).height() - $wContainer.height()) / 2;
      if (top < 100) {
        top = 100;
      }
      left = ($(window).width() - $wContainer.width()) / 2;
      $wContainer.css({
        top: top,
        left: left
      });
      return $wContainer.show();
    }
  };

}).call(this);


