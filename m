Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96333A0EB3
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734148; cv=none; b=YvGtLKDoqen3HgABVvk7wsWgycSfB2ysrdl5FDg38U00qADfK8nnSfaJ+njz1a29eQ4ceO2BSgnDCvIL5dgmyCl/tY423vKqAR1MNURunEF/IQhfiD91dn4gtXUAVjKVPGknJasBMzdfw/IoCxhE43pAICeyA5JOTYN6uYoX6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734148; c=relaxed/simple;
	bh=okw70boujGKEoFWervTiqut+PCDZlczcehiMArR7er0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/709UOQPlpD5HCu6Ik7XROiZd9+ilfbuSpYzukRfw+mtAL0J5wzo52QoExp2K+fCXMlRkviOJWmq52OlvEr5Uk7PFCQBqHvGCxhC9trBXO954gbK5ZUaYQmi1UUnQYwO/WbC+SKuzKHhMy0U7Hn+Z96p5WbRyiF2GXwEcwq1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAWIJngv; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAWIJngv"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1363079a34.1
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734145; x=1786338945; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBn8+Hx956XQS2N8rfelEGrUn9IDXjKs/rR491vlUQk=;
        b=gAWIJngvah2ho6bMT011F9CQ6T6fBgWr5ua8qRv1Fzz+wtujkRD1j4L6iw1ayMyxa1
         uN2+XH4LGsPbEIVoNeVe/A5ioCd6ffKMx4A23XEVx2WymVzE3AcdqZSytCbdNPjJAn0V
         W96W0TL9tHTz5cwFhggNrFviMlbjSFHC649MP5CYspbGppnO1yeHIoIavs7KXOMTOfHG
         ulYkc1Og58Pvqt+klF94drZtas7Kbkq7FjI10JTPISZQNIkja8cHxMje8zjV0zn+xsch
         GWDiAcyL21xus7a03JeRfsl9nVXF1S4voHicGdXW9zcFSk//zSMuJfK/Ao52PtxjhsRG
         aisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734145; x=1786338945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBn8+Hx956XQS2N8rfelEGrUn9IDXjKs/rR491vlUQk=;
        b=ZTzGsM4bUK2Sb2du4o47OVBXaUg6e9bCnxhwSrUeNtUWxeFrSDqRBQQCC6HSpiT4WF
         jCnfy+GXs6c1WBZOrvgAqquiUDZfxli2CsKYZwhmauSdW0ckXK+E9txma9y9tk6eefbc
         3bxv+MmHCJGO3lhVJnLPYftHTlIWg+SmZjTZwc0LHFDJ5WPbokCAqn9v0Xymc+jKHYgt
         CYANxchXWVbOqR4PTnw30556fCBUBDfJ2oewgJ9bpcOxxeEsyo203gMF+n+4a+b9YDcT
         /h23XBxUBavNZVo/rCufAl3E0sKiDMdC6Ne4hdF5QDk/+ymvOFNI3zc1f1DgadeePfQz
         fOuw==
X-Forwarded-Encrypted: i=1; AHgh+RpMa57tvKHraqMnoQI0XLtRiqFU2TSt/sxkM3JuskKNOArEB4/9HXSabvMxgcji8+ORLtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwldAZwMvNJGIGdab9QhXfXg2Xwwqj1pJSgpmx6yFN/kaerC460
	Pi8O6zutbwB0uBTytNbVxyenYQ71BPYbIsi69HIpbtXJzOkQOKw1a+Pj
X-Gm-Gg: AR+sD128RlQg6z4GHGLH9+7irOPGt9i14lrH34dNlDZ3JZw5yeQvAozjm/V7qw8DtTg
	Uc6ROm4HY9jj/xm9P0+R3Hsa2pieZgmikDo/yLMyzOLx9v+hP+boUDJfNhBdIUPtYPUok/jP0FT
	bzGoGeD/9kWbPKp0Ibh7QELIGIG1v6upv1fTCwycMLFz63l4/ltuhfTm6FB/iPnjZs+W7CeKT4L
	htgFvKoEwhk7unj9+d9P9Z2Rm6hiD8+DrFttuyQAq5fEtEMp906FB9Bc4irMzPojBVLMMy/Tg/X
	trffZKe+bL3wjKwZDhfV1m6SvlF21zS5n0EvPRpOL1FlYBNfXArtX8yKQPplTSb9rGn/v1thK9i
	q5Lq8bidfkGqGRCjC3RRlqGPZXbvl6dpD4fq3FtgBMtk+W3Fh6+YYbqtDA5smi1iVlp7qY7BNEI
	n5QfktSRzMOBpfmuib82/lPu09NOqirawvKaLf6aoJVVG8xCCKBUqDhWkGaJ6kH2pE49UjvxQ4o
	7iwuF8/owLg2X7r62c6QjlKBHPl9u1tl2eLYXCi1FIwK/fSLQeMbVEEgdjHGg6SzxSFZdQ4Sl3H
	rui6RK2mvRXA/gNXi9xmI/XXU4ig50u6CN3emsn8yw1NVgiSO5al0hSup2cqLGhrrKJCEnvDDSh
	cO5kCvYi+wJ7Nc0z9dg==
X-Received: by 2002:a05:6830:f95:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-7f19714f993mr12573380a34.12.1785734145466;
        Sun, 02 Aug 2026 22:15:45 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:25 -0600
Subject: [PATCH 15/21] net: phylink: allow PHY-autonomous EEE without MAC
 LPI
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-15-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Phylink treats a MAC which implements its LPI operations but advertises no
LPI capability as incapable of EEE. It disables PHY EEE during attach and
rejects ethtool EEE requests. The same problem occurs when the MAC supports
LPI on another interface but not on the interface currently connected to
the PHY. Both cases are incorrect when the attached PHY can generate LPI
autonomously without help from the MAC.

Recognize the PHY autonomous-EEE capability, preserve its EEE
advertisement, and allow ethtool EEE requests in that configuration.
Evaluate MAC LPI support for the active interface, and restrict EEE modes
to the MAC capability mask only when the MAC actually manages LPI.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 18d2ead97aa5..e64f72793aa0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1512,6 +1512,19 @@ static void phylink_deactivate_lpi(struct phylink *pl)
 	}
 }
 
+static bool phylink_phy_supports_autonomous_eee(struct phy_device *phy)
+{
+	return phy && phy->drv && phy->drv->set_tx_lpi;
+}
+
+static bool
+phylink_mac_supports_eee_interface(struct phylink *pl,
+				   phy_interface_t interface)
+{
+	return pl->mac_supports_eee &&
+	       test_bit(interface, pl->config->lpi_interfaces);
+}
+
 static void phylink_activate_lpi(struct phylink *pl)
 {
 	int err;
@@ -2090,6 +2103,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 {
 	struct phylink_link_state config;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+	bool mac_eee;
 	char *irq_str;
 	int ret;
 
@@ -2106,6 +2120,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	linkmode_copy(supported, phy->supported);
 	linkmode_copy(config.advertising, phy->advertising);
 	config.interface = interface;
+	mac_eee = phylink_mac_supports_eee_interface(pl, interface);
 
 	ret = phylink_validate_phy(pl, phy, supported, &config);
 	if (ret) {
@@ -2144,7 +2159,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	/* If the MAC supports phylink managed EEE, restrict the EEE
 	 * advertisement according to the MAC's LPI capabilities.
 	 */
-	if (pl->mac_supports_eee) {
+	if (mac_eee) {
 		/* If EEE is enabled, then we need to call phy_support_eee()
 		 * to ensure that the advertising mask is appropriately set.
 		 * This also enables EEE at the PHY.
@@ -2165,7 +2180,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 		 */
 		linkmode_and(phy->advertising_eee, phy->advertising_eee,
 			     pl->supported_lpi);
-	} else if (pl->mac_supports_eee_ops) {
+	} else if (pl->mac_supports_eee_ops &&
+		   !phylink_phy_supports_autonomous_eee(phy)) {
 		/* MAC supports phylink EEE, but wants EEE always disabled. */
 		phy_disable_eee(phy);
 	}
@@ -3300,17 +3316,20 @@ EXPORT_SYMBOL_GPL(phylink_get_eee_err);
  */
 int phylink_ethtool_get_eee(struct phylink *pl, struct ethtool_keee *eee)
 {
+	bool mac_eee;
 	int ret = -EOPNOTSUPP;
 
 	ASSERT_RTNL();
+	mac_eee = phylink_mac_supports_eee_interface(pl, pl->cur_interface);
 
-	if (pl->mac_supports_eee_ops && !pl->mac_supports_eee)
+	if (pl->mac_supports_eee_ops && !mac_eee &&
+	    !phylink_phy_supports_autonomous_eee(pl->phydev))
 		return ret;
 
 	if (pl->phydev) {
 		ret = phy_ethtool_get_eee(pl->phydev, eee);
 		/* Restrict supported linkmode mask */
-		if (ret == 0 && pl->mac_supports_eee_ops)
+		if (ret == 0 && mac_eee)
 			linkmode_and(eee->supported, eee->supported,
 				     pl->supported_lpi);
 	}
@@ -3326,10 +3345,11 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_eee);
  */
 int phylink_ethtool_set_eee(struct phylink *pl, struct ethtool_keee *eee)
 {
-	bool mac_eee = pl->mac_supports_eee;
+	bool mac_eee;
 	int ret = -EOPNOTSUPP;
 
 	ASSERT_RTNL();
+	mac_eee = phylink_mac_supports_eee_interface(pl, pl->cur_interface);
 
 	phylink_dbg(pl, "mac %s phylink EEE%s, adv %*pbl, LPI%s timer %uus\n",
 		    mac_eee ? "supports" : "does not support",
@@ -3337,12 +3357,13 @@ int phylink_ethtool_set_eee(struct phylink *pl, struct ethtool_keee *eee)
 		    __ETHTOOL_LINK_MODE_MASK_NBITS, eee->advertised,
 		    eee->tx_lpi_enabled ? " enabled" : "", eee->tx_lpi_timer);
 
-	if (pl->mac_supports_eee_ops && !mac_eee)
+	if (pl->mac_supports_eee_ops && !mac_eee &&
+	    !phylink_phy_supports_autonomous_eee(pl->phydev))
 		return ret;
 
 	if (pl->phydev) {
 		/* Restrict advertisement mask */
-		if (pl->mac_supports_eee_ops)
+		if (mac_eee)
 			linkmode_and(eee->advertised, eee->advertised,
 				     pl->supported_lpi);
 		ret = phy_ethtool_set_eee(pl->phydev, eee);

-- 
2.53.0

