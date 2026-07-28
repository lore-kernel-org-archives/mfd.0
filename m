Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB49E3B585F
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253778; cv=none; b=hyAqsyotXDN3jINfJQ3aflSp2CbTWo9f1zHytysANitZGe/oGDz81hHx4LjaDFQKxm9VOjaLkgV85tgcq7I2BBTN9KttPL0bryajYQhaM2xtcYuk7nNrpkB0l5a7VrLvG8IXLpOKeb0+jQkvqHbND5Yg1jWjzLTCqalfhT5CPn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253778; c=relaxed/simple;
	bh=aew3G0wQnA+cl/zvznbqylIu4hIFGHINCMdxlwCnhLw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFZ9kVzxS5oPkf3tOzy0SLOVeHYxi5pLaFmRZwp/1VzbyrKt+F/6mM0hnBxHvKDUMERvrliwpoq9IEPbOPO+N2YjMoLhARkyjsW8kt7RWRMcyOq0heEnw7dV+dPgGbZkGzdK3wYc6yM4GcWZTDGlVGIUdkn02aJT9KBahZPCy/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwyRKsSz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwyRKsSz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49550ec592cso7382485e9.0
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253775; x=1785858575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SYjaVLSyECwhZTYecx4FhraqJDr8W4MzrHZKpg3sjsI=;
        b=KwyRKsSz60+keFMd7pCWCnTUea+aJr1WC6LKS3l7JvrWHOqqjG5jsQ0hP0/Sa1uhCm
         zKpKFd+LAfIG3IZZau8BbDshNGSlA8nU9c/JnQgNHj7b8u4Tw/Wh6jpxZ0P2pkSsZrvX
         axoRIqcT/ODsUitu3w1zGhsmBi8y9D8IH0dbp6I0UMnDQG77jjF7pWzlrc2b7x75J3wx
         SkLYD+mZCnEyBVrruDe3QSMLd4dKvn9LKIx7XgDlVfuBU8OXmwldD6ogsyWbM6lIg734
         iu7x86oVKDFA1vyJX/tdfvZNSzOGg+3AQWkZ6r/EUcGJxs1oWrxrnDTac3VdUHgHfKDK
         9Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253775; x=1785858575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SYjaVLSyECwhZTYecx4FhraqJDr8W4MzrHZKpg3sjsI=;
        b=jiT5DbUKdrTPueEqAHAcUxzhXfcPpHv4Fqsb7wQtZIaekDU2ZAC4qHToM1ygLadAEF
         sa2r/foE1GY6NyZknAWQNDe2cehXZ7mCQzlYVg3DaCpsZ7N2O6taMG0K8vrt0RNET8Gp
         JPfaqo6ppcOzkXkOc02KA4BuG9YjvEZMB7bjQxkUC5SQxn3pf1d459st/Qm8bX+2Wwtc
         brFOmASL+Em1Nbk90oG/XPkeap6iivWswJpva9hPN6XM8uUN3DCZxYRP8Cju933kCt7z
         1/8Vq5VCZpqagpswBY6Jvf10O+hIksG6GaFsRa0KUAeuSksNpZrzESf4Hh2Bk7I46irI
         m8Fg==
X-Forwarded-Encrypted: i=1; AHgh+RpULs/AVQ4Lr3UygImPN3cziSY+p0mqquD5PL3n4keXa6J2cerY7JgLWtuKjxI/iGROTr8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoygES+2Zt4Hl1n+GKs9QmQ4Vtold7ionKpe5AsqiQWVTK//L1
	Q3aD1LuVxIhYt/Vbfm7s8JZ+AzU1uwT3fWq+0iZcxXH3BBcxmj/iWDzU
X-Gm-Gg: AR+sD10ulyVysqVuQ3TmpsMPoAUQwxDqLbSR4x5WYIhAPKI5c6F8HCw5zYBQi32UQnn
	24gUHvTqf3Jzy3jaBgsnZaLrRgc5IrnBU6NXFLY9lozmlQnZDsUf8EAGzbMKzcHMrjjxbtD8ci6
	0Twl3HSkMNnME7orj4yMC/A1479of3w5LDjjz+ZrADh/7Gufz9mOX6vw/M+bKHXthjn7ziEyeNQ
	fLlYN7y8NyJwWCwHyKXv4quQgW7hWHDTHoMUcYXOfJBHyS1KJYyWSPuWJV2hUjItGxHmlfLGqkd
	U+ndHEygHJ4jS2FrwYbgzO+ZMxY7OrrBjusbgqrNxJg8MBxh4S+WNyxHGWqcfaOfRoxLB6s+VuI
	DDnoaduE7k0YFpPCY0chstWERgTeX+czcL/5GCBekaMk+7NelaEBntKAKBgditrg1cWvq/+xgeG
	M8ruJtjaIlNFrhT2u0nh00hIu6+dbb
X-Received: by 2002:a05:600c:4584:b0:495:501a:fcf8 with SMTP id 5b1f17b1804b1-496c6575c60mr30023435e9.9.1785253775035;
        Tue, 28 Jul 2026 08:49:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v19 08/10] net: dsa: mt7530: move MDIO bus locking into regmap
Date: Tue, 28 Jul 2026 17:48:35 +0200
Message-ID: <20260728154846.1828945-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Golle <daniel@makrotopia.org>

The switch register regmap was created with .disable_locking = true,
relying on callers to manually lock the MDIO bus. Move the locking
into the regmap using .lock/.unlock callbacks, matching the PCS
regmaps that already do this. This allows any code path reaching the
regmap to be automatically protected.

With regmap handling bus locking, the manual mt7530_mutex_lock/unlock
wrappers in mt7530_write(), _mt7530_read(), mt7530_rmw() and
mt7530_port_change_mtu() become redundant and are removed.

The MT7531 indirect PHY access functions need serialization of their
multi-step register sequences, but no longer need to hold bus->mdio_lock
across the whole operation. Switch them to reg_mutex.

core_write()/core_rmw() are the only remaining callers of
mt7530_mutex_lock(). They access TRGMII core PHY registers via the
clause 22 MMD indirect protocol -- a separate register space that
bypasses regmap and needs manual bus->mdio_lock protection.

Generated using the following semantic patch:

// Remove mt7530_mutex_lock/unlock around single regmap-based calls.
@@
expression priv, reg, val;
@@
 {
-	mt7530_mutex_lock(priv);
-
 	mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
 }

@@
expression priv, reg, mask, set;
@@
 {
-	mt7530_mutex_lock(priv);
-
 	regmap_update_bits(priv->regmap, reg, mask, set);
-
-	mt7530_mutex_unlock(priv);
 }

@@
expression p;
identifier val;
@@
 {
-	u32 val;
-	mt7530_mutex_lock(p->priv);
-	val = mt7530_mii_read(p->priv, p->reg);
-	mt7530_mutex_unlock(p->priv);
-	return val;
+	return mt7530_mii_read(p->priv, p->reg);
 }

@@
expression priv;
@@
-	mt7530_mutex_lock(priv);
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	...
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
-	mt7530_mutex_unlock(priv);

@@
expression priv, port;
@@
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);

@@
expression priv;
@@
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530-mdio.c |  9 ++++++---
 drivers/net/dsa/mt7530.c      | 38 +++++++++--------------------------
 2 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 11ea924a9f35..f7c8eeb27211 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -141,12 +141,14 @@ static const struct regmap_config regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 	.max_register = MT7530_CREV,
-	.disable_locking = true,
+	.lock = mt7530_mdio_regmap_lock,
+	.unlock = mt7530_mdio_regmap_unlock,
 };
 
 static int
 mt7530_probe(struct mdio_device *mdiodev)
 {
+	struct regmap_config rc = regmap_config;
 	struct mt7530_priv *priv;
 	struct device_node *dn;
 	int ret;
@@ -200,8 +202,9 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->io_pwr);
 	}
 
-	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
-					&regmap_config);
+	rc.lock_arg = &priv->bus->mdio_lock;
+	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus,
+					priv, &rc);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3c2a3029b10c..5f56a423b147 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -184,11 +184,7 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 static void
 mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
-	mt7530_mutex_lock(priv);
-
 	mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
 }
 
 static u32
@@ -200,15 +196,7 @@ _mt7530_unlocked_read(struct mt7530_dummy_poll *p)
 static u32
 _mt7530_read(struct mt7530_dummy_poll *p)
 {
-	u32 val;
-
-	mt7530_mutex_lock(p->priv);
-
-	val = mt7530_mii_read(p->priv, p->reg);
-
-	mt7530_mutex_unlock(p->priv);
-
-	return val;
+	return mt7530_mii_read(p->priv, p->reg);
 }
 
 static u32
@@ -224,11 +212,7 @@ static void
 mt7530_rmw(struct mt7530_priv *priv, u32 reg,
 	   u32 mask, u32 set)
 {
-	mt7530_mutex_lock(priv);
-
 	regmap_update_bits(priv->regmap, reg, mask, set);
-
-	mt7530_mutex_unlock(priv);
 }
 
 static void
@@ -555,7 +539,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -588,7 +572,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -603,7 +587,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -635,7 +619,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -649,7 +633,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -672,7 +656,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -687,7 +671,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mt7530_mutex_lock(priv);
+	mutex_lock(&priv->reg_mutex);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
 				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
@@ -709,7 +693,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -1444,8 +1428,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	if (!dsa_is_cpu_port(ds, port))
 		return 0;
 
-	mt7530_mutex_lock(priv);
-
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	val &= ~MAX_RX_PKT_LEN_MASK;
 
@@ -1465,8 +1447,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
 
-	mt7530_mutex_unlock(priv);
-
 	return 0;
 }
 
-- 
2.53.0

