Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330EB4EC66B
	for <mfd@lists.linux.dev>; Fri,  9 Oct 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562289; cv=none; b=bIwK1jpTQOPko/V4qnCpzAIOi8IGwWVQe9VLr4WHs6ZRNkipNv/u0lXXcxABYnmW9pORKfOwbHmeB+6gx8kVbfwJJd+8+swNdco/p+OpiuSRsErQqQZtOdovNN9OspUB83KHrrHGZODvjuOPfiBXabpH2V1m9plaO//yMKt5KwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562289; c=relaxed/simple;
	bh=MVsXZuoiXp2XXStNi5GOq+gCp4+6jTB851Kpop8DdDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjaJFEYzIkZ30GfDM4vVdd6J8C+1blo28qzkWIA2KQFyXOGiqUXWmJ8I4/hgiM/LUn+D/9r0NHtnTZ6unoYr7Dt8QrQHNOtXnMWNzJqlPhw3HKiX6QexM++/onOEntDx25VYbneT2a+bM0NC6zbxzz/rtN6caCgIQcCewNyOdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/weqMKO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/weqMKO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so236125e9.0
        for <mfd@lists.linux.dev>; Fri, 09 Oct 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562285; x=1792167085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=U/weqMKOCqnhxUpSsOdCjTYFVNB+QOmMOjQOhOH4TrLXaJfnj0LQ5+JJ7FZ3l9xp+f
         TYKmDJ40X1f0DRXp0hWNvFULRDqvHkA7fREqBFuJjfEqvi/5AZbeBDdswdTe/wFB5SWt
         YrjwgY9CpPyZwWTezmRaucW5URD3Bq/3EgX7+toRd6Y8BfJeSRM82XIMuAVJ/FAOCVoZ
         nKsIeCKN27nsIEOnUN8fCGUnlqfNhUKzRzyI/ryWTPEE8ocFl9aF9QZfUSAN/zivKYfs
         dS4Tgl4X8blVptwJDd+a5T/JfU60i//1eXPKIXNuTFkXfLLWCqNloEJr0sMCNGZLf3yA
         aXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562285; x=1792167085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=bGmbCxZqK1o2yXOFL5GHEnDwj6ooABtHM7dd0IaxVWLv7Zz8GaAI9ukRIUN6IbsUwF
         f6GqmcrSHQ08ppruGjw++kfBXtYIscRqmFRjwG5NlzkWvcxd+TCoVzyoFc1MCazAWf4O
         BaVxdI9UwMAB3UHkVdycU9Veepewj+E9EhZeOyjhrs4csdqN+PZA+hMtdORYukQrUTJm
         C4FgAwhD9QMZM8Fv3qPdeW6vo6AzAoKeS0BrahWHfyyhXId9a4gS5zUV6qE96465HVt5
         DqRxWhO5aB7wou1aeb51mbWyLGtBaFbCskQC8rUYxm8oX4SqkysxWPR17DYUCyarzjfe
         50tw==
X-Forwarded-Encrypted: i=1; AKwUvBzuhD3saSGrJzZ7jB9Hri1Akg4aMr8TCovPyh9sNkVWWfV346vSascRwJIZUoMXwOj4ZQE=@lists.linux.dev
X-Gm-Message-State: AFuF++nTtEKXaj9rigTyy7h2mTOW4pSntcLZAQsg2H8cUGcyRtr5SVnY
	nKGH/0/BYtJbPQ8unEiDMqlmH/+aeRhOC39s4kcuiPkDBdMzAapI+PPe
X-Gm-Gg: AYBFou2Hyfu8TlI989DHbTQjmEKlpQWquISPHLR8kKOfsNPMiwIZ8mehsjUgB32yD6o
	6wsOSl6T/ynP5nQVuLXUU5Pa2LJpYwYovfuQgl8dcABhEJ0jP/AZJa92Tic3iwgZcTIC49ro9kW
	qsnUl6fxrJvTNjeTA142yhWEDK4hz6042B9z4z38AWKy/mK8nKfpcky4J3fKIFU8qPLs29tonhR
	xaQdOag1pOmfVwSYT8k9qKIypHOH+o9rgwt7jq/vgN9OcUBDHEXVtu2+kqzT6ZFYxTYO+NvRFka
	kzbo93Eq7MT0dORHpYKLFRc8MZSFbhHvfHsuELnrbcdA6sZYu2bn/SzKdRy7x4z911Xbz3NTDCY
	QQ+2QDB9atYTbCRBnpmztU4TitHRtHej23evBPqpdKh5k/OJk4/wtTqcemNyVXOGO4mzqxRQJz/
	keICbSRxaDied7ePPP+oI1s+AvW0lC9pWumYW5R+xtRcRiu636q52QNUk3082YchcRzVuO+MkEg
	7ZMp2DD/Ob5OTS3fympYy4jzLHvZNvmSzoeKBpZlEZmIhbitYXS/IxT6UrOH1eqREUOGaKnGdPv
	mVRugZeShgNuKwwtQA==
X-Received: by 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr48332405e9.0.1791562285176;
        Fri, 09 Oct 2026 09:11:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v25 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri,  9 Oct 2026 18:10:52 +0200
Message-ID: <20261009161102.38961-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..53dcff93f896 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/mediatek/an8855.c
+F:	drivers/net/dsa/mediatek/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0

