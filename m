Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C2395AF7
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734129; cv=none; b=i/Jcy/f3GLr1ElonKpKKi+uCNYQra+Lm4iezwKLjcFmnG1IkkwoI5U79CU3UyAL3gdqbL5+enytqWl+lxWH6McBwf8yJ4u4FkmGFUNjgYvHGEDn7acVcwMnvgPU4iRLEHmkDtNSch5FY8blrUg5RzRoTjNWVodk6euLXJ4p7e5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734129; c=relaxed/simple;
	bh=APfgpJTVA4pOI91gbDaanL4SMg80qg6DwGibNA5NVGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sksvJ78MXQiwpyzpaiY2FuO8S5nAbAb/yv0voN/fzxFs9aL+Lcmp4UQdNS+OVWUPrsw7oxL5JZpwymo+OfaEYuYQSc73GHAWYD5iA1paUU6coRK/aRMdlIwbYoIaYSA+e6BoBZlewURjqN8pVUK3Cg7iVtcFal6IpGBnMdXA5bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEccS9VL; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEccS9VL"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb61bbeb25so2151888a34.1
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734126; x=1786338926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=JEccS9VLc/PlJD0Mo1D5Vg85nXMsC4fIaegbruqeTzwtCbS3a0cw1CV5vyp6toFPAR
         K9WfSZIDMIqoCDHEal3wePPURMoZFTs9Rhdv2hAHF1hh0jXEL3Q9aiAZ8o4yR6wxjozp
         2YYbPRmvKvJS+FHGskBeB28OMCTD0/Tv0W1fzV8UOpjVElkFI8zRB60ociILp3miC53D
         YgLbaJgjzeRLU3OZdq8Pw35bDNq35NWfe9BnaSLNoaC9As7zw1IQ+0iZ5Jrakctl4qTd
         UQUxNibqEyBRsd0IAlEnTOZPaUx9+ybry5TX5PACkOJMmcBQJsJp2eyMMDTTd+oLQkgj
         cq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734126; x=1786338926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=anA4cBf1lll4IXm0q4vf3HYPDFKYvf2Y4ylySDSNvjdjVB1FyMb96yGnkJqAs5PQrU
         GoTwNS69OXCMQJej7OF4j8sfwdSsP37YE2piTqVZxj0hKq7GT5zsy8rjdoVBpBLyJxGG
         KZmA7qzb5EQxLaNc6RQLWRbXmznWzKqNi1L5lbdKwcSEa7giZZzBVf7eCF+l0axg0snl
         y0VkmEwoS6zFkEvfmxWVDtN0cKU5sqBsea8HI0M5INHgK7dfCHzZIVCm20jKrG5USegO
         NiMOYKaVlL3SdjOX0uSr+IMpj94NNfADHLyyeK/2GS9q5RfjRocU4O5Tmek3wr7cFB3Y
         /NpA==
X-Forwarded-Encrypted: i=1; AHgh+RoS6dXeGjAv4c6BaaRst+VXuiHZ82uxw5dxRqehZz1sQltVNKlMEB5EoqmceqvnyeLtqgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT3HF9+KHbDZKofbtzDWmgCxHjmaidhcJ3DR69HiC6JfSWi7xj
	fXn1m7obJwZxJU23Gfzfv1BTadKNRMhBV4Pxg/sunzJJBUYn/udrAZIj
X-Gm-Gg: AR+sD13iayU65+J89IHW8adbUl+M7TKej+KCD1jLj9uqyx6qdoGSz0TFtxjjFP15hpm
	qErK+BkDrBKz7weK5HFN0o1pyY0Jdb9Q0AKt9BlYTH+fOgiwgt0XjY2FfoPW377R9qO0vOEXbMQ
	A/7BAfUHrXt9fjxSmyugSn0Czc5IUe5S3ZxaG7VhhWHY+j+InB0eMjPlynpKVnFhDCPedDicwev
	GSThtHZgysQkkmnhgSdHHPJycKOYNXY3o2mAf3y7LF72iQHqnO/LReBMd5RikI4JAs8vWHMtHP/
	Q1c7X0Lio3ndYo+5IaMZfAWpKW6D8BITi1rtact20fq6RmBWy4W4uaiFs6sS794/sy6Dq6cCxc7
	7UeBugUgx+g8G7DP48QJfUHc7nKZfLKmNOUNwCEqJTA0KInQxMjuW6D0JqhnWMeKVm1Lf1l4sgW
	kwaKxZqdH7lrqrA72xdXtoR3xGms2+oF+xyTxjn3kRZllrTWaB08AKBjCCnp/XOh57qQurI//42
	NxYefdtezWImeSp0bYShDryU8gfNvOZ6Np7oNNCHyIJ4eKNqG9GhFxSQQcE8s1Q1Ku014muTfAl
	O5cjlIs3dwDAr+drt82vB8bn2fOhve4oGQ1MvpetVY0oZusgw0qkMdjNu1rlGtgnENFfHGqIU+A
	7qRPVzumXdEzuTemq1M3oSwT9b3RD/0DVJaqL/A==
X-Received: by 2002:a05:6830:8389:b0:7e9:e709:44f6 with SMTP id 46e09a7af769-7f196ea3b40mr13694676a34.12.1785734125552;
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:14 -0600
Subject: [PATCH 04/21] net: mdio: factor out OF child registration helpers
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-4-0a53cd9e21cc@gmail.com>
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

Live OF reconfiguration needs to create the same PHY and generic MDIO
devices as initial bus population, including legacy PHY nodes that need
address scanning.

Factor fixed-address child registration and PHY address scanning into
helpers. The old scan loop also visited every free address for a child
without a reg property even when the child was not a PHY. Reject that case
before scanning while preserving enumeration of valid PHY and generic MDIO
children.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/mdio/of_mdio.c | 66 ++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..051e449bbe7c 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -77,6 +77,15 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	return 0;
 }
 
+static int of_mdiobus_register_child(struct mii_bus *mdio,
+				     struct device_node *child, u32 addr)
+{
+	if (of_mdiobus_child_is_phy(child))
+		return of_mdiobus_register_phy(mdio, child, addr);
+
+	return of_mdiobus_register_device(mdio, child, addr);
+}
+
 /* The following is a list of PHY compatible strings which appear in
  * some DTBs. The compatible string is never matched against a PHY
  * driver, so is pointless. We only expect devices which are not PHYs
@@ -136,6 +145,32 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int of_mdiobus_scan_phy(struct mii_bus *mdio,
+			       struct device_node *child)
+{
+	int addr, rc;
+
+	if (!of_mdiobus_child_is_phy(child))
+		return -ENODEV;
+
+	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+		if (mdiobus_is_registered_device(mdio, addr))
+			continue;
+
+		dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
+			 child, addr);
+
+		/* -ENODEV means that scanning should continue. */
+		rc = of_mdiobus_register_child(mdio, child, addr);
+		if (!rc)
+			return 0;
+		if (rc != -ENODEV)
+			return rc;
+	}
+
+	return -ENODEV;
+}
+
 static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 				   bool *scanphys)
 {
@@ -164,10 +199,7 @@ static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 			continue;
 		}
 
-		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
-		else
-			rc = of_mdiobus_register_device(mdio, child, addr);
+		rc = of_mdiobus_register_child(mdio, child, addr);
 
 		if (rc == -ENODEV)
 			dev_err(&mdio->dev,
@@ -197,7 +229,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 {
 	struct device_node *child;
 	bool scanphys = false;
-	int addr, rc;
+	int rc;
 
 	if (!np)
 		return __mdiobus_register(mdio, owner);
@@ -238,27 +270,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		    of_node_name_eq(child, "ethernet-phy-package"))
 			continue;
 
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			/* skip already registered PHYs */
-			if (mdiobus_is_registered_device(mdio, addr))
-				continue;
-
-			/* be noisy to encourage people to set reg property */
-			dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
-				 child, addr);
-
-			if (of_mdiobus_child_is_phy(child)) {
-				/* -ENODEV is the return code that PHYLIB has
-				 * standardized on to indicate that bus
-				 * scanning should continue.
-				 */
-				rc = of_mdiobus_register_phy(mdio, child, addr);
-				if (!rc)
-					break;
-				if (rc != -ENODEV)
-					goto put_unregister;
-			}
-		}
+		rc = of_mdiobus_scan_phy(mdio, child);
+		if (rc && rc != -ENODEV)
+			goto put_unregister;
 	}
 
 	return 0;

-- 
2.53.0

