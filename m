Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6285F3CB56B
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954864; cv=none; b=A40Kho7beq2RH+eIUiDdlKvqgUJ/LmTdLLbgIFbw8AVL0JmUhTUacWWj4YdryVlsNzU1kyZEdMRnXq5r0XBz8cPkoHTwtuj8jXg8N1hncOaVynqI9UAhND+uFzpn86Cp9Pvz0q651OsbrCcFt4pUwONBkGJe8TBRATrtKq6xxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954864; c=relaxed/simple;
	bh=6DeTG1xa/Ln65H62/4x+LMvP9NB1O1vI5av2V+UqGgc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOEqlUXp6eJbVz96k9pRnKKDuc1LoZhtlpo8qXoqQ6oDDwiaymudOk9HlCY43urB9nBrKroqocybe+T76D0iGj4szuDXpc2CdJiP6xhn3KwhBn7UXLYvNckGZeV6f58XV8fmVPtiTZVk8hAWzZ/AMHLuRJco11afV/ORjOKQ7Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5dJU2y3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5dJU2y3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980dc26022so30755525e9.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954859; x=1787559659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M9T+8NIUGYBAR6mlNIug3Q6VvqG8vRRPcgCMH1v4erc=;
        b=E5dJU2y33InxUg1sU8P6Ljksf7XsILitTmfnkeeH4FYZbt62Y7DCg4P9dsosYu6JPG
         CRvyH3pFfkyHvsQkw+oEb47DBJVzJ2nOhVFGi8G+btIuV9JS/Q8ieQD/TxAw/s5fDm96
         9j2urk5NXmSsvLAKpjM5Zm8SBOAUTV92t3L2LmZOHDPHDWMPP/PYqEX+7yb2s4+J+wnZ
         Wt8xFx5sboIAYE8D4+fptWjalPb1V4xDiwWNgUwClLZnwfH31oF3vb494NusNQc7flOq
         SpZ56ISDLKersFwwK7noqvPhvndHUYv1MlHgxYE3G854Tn3IwlCkJDCGjj8eIlAyT0rq
         3EuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954859; x=1787559659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M9T+8NIUGYBAR6mlNIug3Q6VvqG8vRRPcgCMH1v4erc=;
        b=bhz2RHJLvb2fX888AJ6zBoPthxXxpKM+ppmWpC6qyG95CSL21ovZhu90OafWhj0cO+
         sGMaLHye7MWvThUdXnsIz5XwM98zEZBwMnThw3JNcmZs12JFUrAeGMsyGuzG5TfiG7Vi
         AbuyYQfWmdLXHDfpmxWxbcbBzYAkb9gSZHNyhm0DDV2gfzfTvjYdnpb1egpoGMW5UeH5
         ZAoaHcuK4rSIbBFu6RGJUCfk94X3a+GUoNoBuOvGZlrD/vJOEEO/bIa74DHE2F6Zw7bi
         XW+BM+xugxS5p5VMAySMsfIT0K1W1MjHwVJe6G+ynF0KseYMxZfiAkk7OBepsEhSIFRi
         UI3w==
X-Forwarded-Encrypted: i=1; AHgh+RraaPmFJwayVtr+x0mLB5jC5irKyh/iQiQ3UGDftK8r58uAZAYGHNkXJaB5vgI3TUJ/uvA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmfC2u76NUVMMlb+ITG4eHmN5k1UZzww1P5oU2tYNKAwdOKgpp
	MGA/C571wSjLBqII7KGiwAta83JBdi24PYDw7uSKI5AVI4P7XeR2u3R5
X-Gm-Gg: AR+sD11NsgvpZaOKXMXjy3XYOBayAxy5eFtvvHxMk3Ia1ijNU1qbExAuPGc5MYlM6QX
	CR4yh9C7oqGGKeU/wGmjgVdC4uFTxOrUb67Fk+1aywk+7WIDGpiAxzaQhfIolYvtmgtBCvQ1+w6
	Lw7HrUj5NwESTffuunFTUohkH0ikkycC9mW7c/MJcGzTI7JpMSTt+r1BwqG4CmrCWVq/2PtQapD
	s3sOK3YREKGHe/mbPRQeFnq6ucWv9NkXrcX+J8R95qkkCYrdy1K7uu2ObU8QkLcsFEVWbTn1PBl
	sI3OKNTkdBa8v9IFVOdNg0aRPBsy88cBrxgXHCCYIKXg0cIYSs8MLtxlM7b3zOuBTrXoNebGP8S
	0/6idd8zXnkYao+cZGN2PZ/WWIT54zg/BQgC6UOBFq8iPoRUi+mnOb6WZUk+wADNThUDZjMljlt
	dkQwrLlmKjbqDbyyme4MQwdIlO0NjA47joCJzyO05/oFLaYoh1wVaPo24Rn6wW07Nf02vZpGbsR
	C7eOj6/ioJnqyRrdT44FnkW5rCF2v6VhhnzT1Eow0ejA23S4yFjEuO/OLGDfJdMg/Y=
X-Received: by 2002:a05:600c:4f52:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4998793dafcmr362760695e9.7.1786954859332;
        Mon, 17 Aug 2026 01:20:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:58 -0700 (PDT)
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
Subject: [PATCH net-next v20 08/10] net: dsa: mt7530: move MDIO bus locking into regmap
Date: Mon, 17 Aug 2026 10:20:30 +0200
Message-ID: <20260817082034.20326-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
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
 drivers/net/dsa/mt7530.c      | 36 ++++++-----------------------------
 2 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 784dd58a7158..422f785d2143 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -148,12 +148,14 @@ static const struct regmap_config regmap_config = {
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
@@ -207,8 +209,9 @@ mt7530_probe(struct mdio_device *mdiodev)
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
index 2b7be091c056..d01772cfe3a2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -188,29 +188,13 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 static int
 mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
-	int ret;
-
-	mt7530_mutex_lock(priv);
-
-	ret = mt7530_mii_write(priv, reg, val);
-
-	mt7530_mutex_unlock(priv);
-
-	return ret;
+	return mt7530_mii_write(priv, reg, val);
 }
 
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
@@ -226,11 +210,7 @@ static void
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
@@ -597,7 +577,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -645,7 +625,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -681,7 +661,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -717,7 +697,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 	}
 
 out:
-	mt7530_mutex_unlock(priv);
+	mutex_unlock(&priv->reg_mutex);
 
 	return ret;
 }
@@ -1452,8 +1432,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	if (!dsa_is_cpu_port(ds, port))
 		return 0;
 
-	mt7530_mutex_lock(priv);
-
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	val &= ~MAX_RX_PKT_LEN_MASK;
 
@@ -1473,8 +1451,6 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
 
-	mt7530_mutex_unlock(priv);
-
 	return 0;
 }
 
-- 
2.53.0

