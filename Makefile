include $(TOPDIR)/rules.mk

PKG_NAME:=hello
PKG_VERSION:=1.0.0


PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_CONFIG_DEPENDS:=

include $(INCLUDE_DIR)/package.mk



define Package/hello
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=hello is a test utility.
endef

define Package/hello/description
	hello world
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/ 
endef

define Package/hello/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hello $(1)/usr/bin/
endef

$(eval $(call BuildPackage,hello))
