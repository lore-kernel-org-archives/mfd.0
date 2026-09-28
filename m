Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19EF4FB9BB
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624773; cv=none; b=onYhpmjq1iZMsLR4z27qOWhrJD2DI4dMXbL/1zsnA/dPr9i0StOxanFlRd+E8Nw3O+6NnNXLeM+W63mlexC+vi/JNR+0I3UpSyxbImeS5RMtzOQOwtibpkOMn5OJn67iQZUeTRmrqHWPfEsUPoFBp7fref5MTifaj3V3YmJAyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624773; c=relaxed/simple;
	bh=U8IAY3UtlpNIRXvSA2LyZf04Cj27BjWMLF6IcBxyyPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdut59TjFNcrfhQQ4tEN2HrrhuM2pGB9x5xB38gyqB+I54lvO+CpYyKefjDO9K8lCFJasOPnnY77+98axQyVTWrNX928jzfSR3z57aMRKtPXtSOGcepmrmbJ16zaRT7dxbHEQzN8C4OFPkgn2VzDa32UfWzd9TEC7oYx8g0DfK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGmC0cch; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGmC0cch"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2843213f8f.0
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 12:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624770; x=1791229570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=EGmC0cchZt9vfpzFhukGDU16sDuTgEs6FpCejuyrwM2/Tq437UP2LmiIdGl+9R0q9G
         p4/rJ5fP+/BV4kWJd1ezL11Eek8KW8jTcrF1kg8imI7nNGKKwr77fUj9+ZiIaxuKY7ag
         XTzEzoGSZfriZ9OoNP7VbhmR43Qxl9+pPRQ9YEXEXzFIuI5H3Jr0Tt1da2RyVyl3cmz0
         SO0dIcqu1WR9OUlBZYhXxFsBooaZEHePysXUfD57K4k335M/5/n/KpVsz4FotYUSnRbe
         DS1B9QBLUlmGG3KD9W4YYqJxNQwabzG1heL0vRGjptybMdQQcKuO5XKNcmLST0X9M6jx
         2oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624770; x=1791229570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=YSRgii9uTpeESyajio1lKO/qGmFUAusNYFfPzDsF/ThPEG31N30vCCCZdql3ujlhTk
         kVDXMduhwkxuXskTcetEPET4vtX6f5jSxD0VJl9ieOK6JesMdyr4DkCgiGVYBGVDyIfh
         5W4InZKEvdu39nioIaOiqEyr5YhFMoSJ7td/vLDQsxYJ4laTbWb0k6aAyq3jpnW0vY8V
         DZOPxp6Ghlwmxy6czhnM9NDgeihYVqgfl0pSKwMzAy849TBfeT29Paol4hE+zhunzX1w
         buMBkY5DFRzAXdVL49hWAaaRrcAKCR05OJPqO2+0kV9XVKrZXI8fRQTfM5csyGtrMDyX
         d4ag==
X-Forwarded-Encrypted: i=1; AKwUvBxGzFylpioL93PL+DMREZqzBURTuJ+1e85f0ZaKjnIMMtrv6G4iiwZL684q/Tq1Y+bd8EM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLBCZJPPJs/luvNGKl4nSacKWekXSp7pfDJGsAjDBZ/kwStDq/z
	sq3ohRAJ6oVHTckZcdVcixU84D3/VIcLyt+GOkTeWksOPGfwHcZ5MMLp
X-Gm-Gg: AYBFou2dh60MFvHwPAjAyl5tj4AbKXPlxgo5ThBkhA9Nct8ri88VI8OWTsleDm/XqIY
	1dFyRYkzNbHAqvqfm7nctbebOjdSz8TjEQuGCYJzHN5nmumhFbGfZRhbVW2EhBvKkoVv6jfeJKC
	exkfMdAnd+nB5Rq2599zCIF4k7jQyhmrhQKp4tAKmEeYu5E10vzJGUw90k25/MkkpfGc9nV5+WX
	s+3mOyJ5ZFaSOXl1KrGbDotQtoKbAYoyg+LldcndLGeuUwbIC7Pipkr6zBjskK4jBAZkgGwLG4L
	VfDsZqmfQmf0TA5wZ2ALwN5fKiJqVwz5/pCm2bW36pQ+bt0gO26bqhxLfg/O9yzEbLU7QgEDdws
	+ueAtpi0Y3uqYgS36DC/U6ByzeQP3ufhQDdUEOnuuRt59U1W5VgtjOuI+g8oTNQJt9Hr3WssqxC
	dDozQ7bs0q+j8Yc7fFAEfGmcB1FvMfhMNSonaQhCyarrhgKvnmKNd+aSKvT26DZJK0Nh3c5G9Ew
	Tquf1tv84VYxJWQoz9jnxZXWqAAcK4EwwzOEq6UV5Xh8ckumRDt/+XxMXq1C4x7
X-Received: by 2002:a05:6000:3110:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48871725321mr27594766f8f.15.1790624770026;
        Mon, 28 Sep 2026 12:46:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:46:09 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v24 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 28 Sep 2026 21:45:06 +0200
Message-ID: <20260928194511.41878-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
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
index 6de1ff058db6..59e6385b2c50 100644
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

