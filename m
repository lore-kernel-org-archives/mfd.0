Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7F3A9D99
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734158; cv=none; b=B6KU/Mtpbqp5N+SxuJr1FFchf7HZuy9xEpMmuGDZMB8u8n+CfK9lkW+pQJqDnixRxfq/b2OaqiXmNjJYSZk8kWrNbemMsGTV9Y3lNOrw0fHlVhr4qNToUw3jkztu0xmFGC3KrC7pH+sm7ddidlS7UtmNimqMmVlBSCWnsyAcl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734158; c=relaxed/simple;
	bh=GJHoT3sGNBaHJutusjqByQrs0uUzgfDmspxJwWo+2Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzexnf/JYGO7h9siuscLVUvJSEk6C/w9xItH+YKk6q2IqI44UTEdxLEjCCCX6lDOwAcHDPdRMsqPMC8HdofhLmhW/w0wo2vnbv16/oo0m58tO1hpBIi4mWXL8NB8aSIaOjkS08AlGr/zcctCsahSZR+dos00H3spDg+3LgZFcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddlBjSIC; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddlBjSIC"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6b554044fso2627415a34.0
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734156; x=1786338956; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=ddlBjSIC0JLpOdHtY5yr0+WvOyyCd7SCEKcgMXvGST2Ldwf0BU5J31wzuOHHk0ym2X
         ubI/OyjsBMrKEnikRzEKDf8yrEV/9L/f0DykHHBhTp6sBBs8nyeY+Wam/jvqvLts6j9z
         A6EZv7TfXAgM4Klh6F+TlY/Mym50jn2wLyq0bo25jpeFmqGy2J5XPlmupLqfvoFXGBTT
         RoG/KKOBlb5ocGvh8FoirWSAX/nsxg7+A0GLFW0g7Uy7NlVD9KnTny6FQlr9mthyLWje
         fRcTqwWyqHDzJvSSwUpFtB223gS2aYNWnEf7PdED94iriXwsZhzUQOaMp9s4JmFPkfgg
         /lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734156; x=1786338956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3THAfFmoIZwxbw2uyAABLxKH+fs/K6w42J64CA1198=;
        b=Drl6QRpOUjmF0vyQcnyErffG3U7Bl+7OR2bZxAVWJE7xuLca1zfJAWQTFfIlpyGHMU
         2UXMjeI+46aiSNYvfkHS6glu92gYeaTYvtOjI8uyk6XO1vGrWX9DLvT8Ri+gBj+vald0
         USBj8nUmhhJyL3UMGwEJIL2NJ5cHGrHpCFb52JOyDruYbgZaiMPOGwesYyXHsFGf9c29
         UCbUOQXkaqyogqCBosO5AAlkiFhIgLOw2k04Wo283JwJ5D3h//1ww2571icct93hiZv1
         50w+xLTQe9tdoe+ve4+w2w6jh2kvXk2+aWE6nvLFBlFzc5e1HWOqzgsziL+04xJz7BcU
         PxQg==
X-Forwarded-Encrypted: i=1; AHgh+RqTBWWX30ynwuCcthscR9VZIS3gTBsPZZjFSLdtH4OI+CkO1A7w5nmRMReVLdF18jM7vDs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf8pAWIIJ04HQ56t6rIFAiHtTpZAIzxPPsnorHR8M1XKHdPT5g
	AazRGwyvPD2TPlBY4mqtF/Lmw52dxTeb1sMgVSuLyEsNa97XyTP6ys8b
X-Gm-Gg: AR+sD12XxXh4Hpfs3GFiyu2jJ2yLyZmeo3YjW9SAVR1zWQdAz5+v2IRBGQ6z8DVcwbz
	czG81QwFU3LK5Q3lj6ol6Sjx++VeFUH1VprZ8sIZAo5kLmb2eks2UWYMiQVPGdcbPfMoHizDpGg
	DEZRQgW7wyOtUjdIFsKNTs4DJn4vU3CdjYZJJTvIW/T8EgVfn7KE7I0O7j2GekAWxyH+kDnMBk7
	dTn/31uKJXn51XyOxAmFvcEiMthSfGMWVEL4knE3X7sae0YS25PXmvYtrIkbJ7pt2cQVwp6+OYd
	wIn61vvWSZsmt4NGa1mEG55pdPhYiVTdqe4EroyyWaS+Lgn+0V2yrTz5peHBOvQfz9pkEyVdU2X
	c1UE69isajQJLUUaVI99UBnIr/ktnAYQ4E2jt0gQdJeRwtl/lthMi7g25MF1SMFoOWdzAv/dFRa
	kBrkjsHAxYUBTnzmynbwFKWN+jL7pwqE91A0wY2pnrapg1AyAwgk84nRlgYufw2xK6sx/ii2+KH
	tXmPVhMPFJs9y6ouyg2xzicKvUckQdB/oToCBmwyY88nqNPhNeaajFwh27FmMsn7yP15kHkPqVK
	hh94/P6nb3kcX3MjvS7QN8i8KCegcbIHvTZO4cMl+ck99VXcV5j+XPD1frIb9xjun2yaL2Qbjrs
	qZpSc1axXV1HQhBsdZ0HxI/CC5IQDsir+1wyB
X-Received: by 2002:a05:6830:2a8b:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7f196cb65a7mr14526881a34.1.1785734154482;
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:31 -0600
Subject: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet
 support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com>
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

Build the H616 PWM clock provider, AC200 MFD, both variant-specific
EPHY control drivers and the shared link-PHY driver as modules. Enable the
netdev LED trigger as a module so DT-described PHY LEDs can use hardware
offload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..53f6b8edaf33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -475,6 +475,9 @@ CONFIG_DP83869_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_DP83TG720_PHY=m
 CONFIG_VITESSE_PHY=y
+CONFIG_XPOWERS_AC200_PHY_CTL=m
+CONFIG_XPOWERS_AC300_PHY_CTL=m
+CONFIG_XPOWERS_ACX00_PHY=m
 CONFIG_XILINX_GMII2RGMII=m
 CONFIG_CAN_FLEXCAN=m
 CONFIG_CAN_XILINXCAN=m
@@ -828,6 +831,7 @@ CONFIG_BCM7038_WDT=m
 CONFIG_MFD_ADP5585=m
 CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_AC200=m
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_MACSMC=m
@@ -1325,6 +1329,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_LEDS_TRIGGER_NETDEV=m
 CONFIG_EDAC=y
 CONFIG_EDAC_GHES=y
 CONFIG_EDAC_LAYERSCAPE=m
@@ -1726,6 +1731,7 @@ CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
 CONFIG_PWM_STM32=m
 CONFIG_PWM_SUN4I=m
+CONFIG_PWM_SUN8I=m
 CONFIG_PWM_TEGRA=m
 CONFIG_PWM_TIECAP=m
 CONFIG_PWM_TIEHRPWM=m

-- 
2.53.0

