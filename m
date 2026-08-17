Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F23CB56B
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954861; cv=none; b=fYuYXpThO+iQOTMxkMwRABP8qF2iqcg/XsXnZIgnpcmNRKSTi+m1zxV/G+aXJWN5QbczZpwBPpWCwrNrIBEqZA+p7/wKaxQ71Sw/b5PUrzz83eyjxAUHk83J83fsNAGATDxaGwjZVPLbKTrx5RIzTTnSv/1/zL4uko73uYAFzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954861; c=relaxed/simple;
	bh=QFgNYbC5iGgbyr7HDWbqxazTnqPm94Iv99RuR51kLAo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7QHGbM/05Oskeht/G4wJE4zNDmYv58fjXgwm1rlgEy9ltxBY9h7y1jgKMcjAcYdatOA7R7r6DuIOQNbu3kwyQuayjOx8mpFkglRSqvC2g811g6w1up8c+NQCZQ1THEEQikFkNyHJqot+4GUKIhhzaG3C+D/B52ZjJL4jpbL9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG5tGOeB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG5tGOeB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49558ce01afso23535895e9.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954858; x=1787559658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=;
        b=aG5tGOeBaoeckw7qejcb0lJZFZgU1/D73H1QZGLyqnykCwOptSzZfrSqGlHvuIE5zF
         D8XeNdvP7bAN448LNzcAh8PtJOtASj5K+bgOnoPK3olr32TffR4ReadLhwu6pmEjMUUw
         2cwrLiUuyJ2bre/OP4JdZAagJY5E/4YhH/YTY1osnRrn+2qI/HR5dbX5hX4JtrptXpzG
         36/pnPW3Q/eyp2mG+HFVLWXqkfuSGsp9g8ARajqsAhZIiY8iP1hCasq4jngY0viuh4m8
         ydz6cygl3X4ojqb6tDKyFTPz5saiI7iz28PV0ESNqBrrWleakRv2HgICttCNn0bNtV5+
         6Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954858; x=1787559658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=;
        b=HhWaYTsuwYEGV7ZIlqXCTV3Mm3P4LJlgm5sNkaAR6MBQbEbcNWE2/WWdW0mPlDrsEe
         Juw0pAxUKixArj9EFYH+8EIquiJLwPyqNj8DrsDp1T8W9CUJCU3GITqc73ACZtqGwg18
         wyk1KBhq9AbajN8t+rLZg7umpeNwhvNMLmOHbrKEY6qX0MpzWPvrR9aZbYDhhmiTYV+E
         iUuqE6PWggSEVtNXSQVYGARY/mX5az9AHbGHl0TukS8Luy1/UWGsOeE+V3/cQI0WoBFh
         4Hch86STq2TqV2j1QaED9FiZbFAzHK7bp7OsDiTdaaI7irGF9ZPcSOUc0Htw/A2UxNwL
         BVdw==
X-Forwarded-Encrypted: i=1; AHgh+RqS+LfUh2jiBuScivvZyU2eeRDDYrilRj+YgDGKYy4Pvv1J5CkHitRM3GVvQmjZONKqeo4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvbjxms0AF6OVwTl4IKhiNEK2NqqyP0xNew33iIyZySKjeBvos
	FxiwUMo+aFppZvx0Fw/9VQ9lxUwK1D+IgIzUe3SsxmLUW0X23SjOXkqA
X-Gm-Gg: AR+sD13gbwsfkbryqgkvAE3D8dc8QRNI74uZS1AXpMkVssNVuEtuR2he5g9+URFEwD0
	L+krUHc7LtbJ+zdJEMXViomGj8HdUXU6x0wkLfza6B7nUkgLyUojYvWNfArh69ELFh4Suxlk7Ry
	T3whlS9zw4fQbC2LzpocYSAGKAln19Boiku/gEQ4ESgcD441mSPZvat2zt0zqtelDHaI701leSt
	ugKZmTC/A9u9PHiQCTZ9sPkhTjwmzBUApIz4JAPU7OleFeyPorKyFoZzcvy/9JUQ+IbwFyS06mA
	nlmAx8AmIoNDB3sRbr27cK9+pHQjbMXwIlU43EA/CHYANsznWwy1sshsAmswOncxYdwlSSYswhD
	K1TokjNSR0vgRBy3vcvKzhnsqTvTisaWSvB5DKsbVhR5SdEjoR5SYkdizo1loKXnQYCvSVJpeMX
	6bIqawQxFCIfPYXqE1rR9lxR5HbY2KxcWX+VSo8ckcjxX6jsrPh6MkDTFQZrbYV8Jyhh7LZozoZ
	/gin45oLGYVffetlWxFyejFb/n45BTDZxG1+y6AM10jjWQBLujBbBwb
X-Received: by 2002:a05:600c:34ca:b0:499:7f38:d77 with SMTP id 5b1f17b1804b1-49988cab011mr368103075e9.6.1786954857528;
        Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
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
Subject: [PATCH net-next v20 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 17 Aug 2026 10:20:29 +0200
Message-ID: <20260817082034.20326-9-ansuelsmth@gmail.com>
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0e7fae5b92f..d9338fd2f19c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,22 @@ S:	Maintained
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
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0

