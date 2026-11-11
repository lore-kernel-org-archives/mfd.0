Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415066;
	b=z8f6SLzSGbz4oV0ImnhVK8SVWJQ3+aU+zqRaxbwde5EYVK/NXw97I7ALoew93iuXneX8
	 tAZslw6MZhHY01CaAMi4gaN7+FXze/PoNTAuns4wkRO4Qz5CMQmbn2jf1chi1/vyIJZoP
	 fYeAzwB93cHgaGTps3ayVkwmSTFiDya0rY9SW5Zo1L6UPLg3I11llYf/HPBXllBRdkOra
	 KhjX1El993Ds+Yvjq6wRp8aPr92DYHhtvd40zDWDxcv9QDzpLe1+fAAQipgplrmzc/u5q
	 3oE+7FXbbgiohDyMdx3BV1DX1ofOdZrXWG0rniwOL7MAR+USZq8jEXlO3v/9iLE1XWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
	b=v6UCUR9+3m50mRV5dbDq/KmvfYsNnJJVWDxTlqyMxw6xsr2MwWIxszy5l0SA8tMBeK2S
	 JsBQRkYwSYKvdWwWNKCPS4/J/yCT0Y/w0ClLXy7oVnYH/+jC6xeJpj1jR4WDEbhAzobZv
	 55gYnOXtSOD6hy+0XG+OLiO3xKZgasZzIoR0UVOLIGskH2r9sQOU7AyO393hq3N03HLyr
	 GJ/9ldqs/dngUQ15B0Xnl8Rda94lLARLxSINEGoaYaqrsb/Q/tfkBDgWEKoMfomw4uUx5
	 ++69oiV8+dLXy/PruVjBr6SevnzOuYmU66W/bbpBb/+RHbnj7utyL1+JyIOr9pcuYJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H7xMEtf/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4390606A8B0
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4390606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7xMEtf/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23274845e9.1
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415064; x=1795019864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
        b=H7xMEtf/D9x9vVGyFDFBNaHS7/cFxaBI26neV9mr0dpGLPRET/qVCI0XziS7VxlQs7
         2tR+9FxmPt5X88VO/TsKPTDuX9QhuwuAXryZFh5i62k9lXmRnj2DyPT2t0uVO+PSsYZx
         VDFetd7xnj2xWbeo/YJ/tAjvt0u9AQ15Jl826jTWtnyExkPqBU0dwY0x3X5rtnZVNNe4
         /jAsfo8MeoxZmU7wgy+AAuU/fQGBos6MVB98uy2umht4XjhwJanWo+uCKU9aIkHYRpQi
         EBKavGDcXcjqCuTE0fy4IQwrLcYSGkC9ZLFQ6kJkhdFX1X2UhIsS1ihHZLpv7TNA2KN2
         FQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415064; x=1795019864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
        b=mc+LM10KYYsj4kbVtZRezV0IqetJGeJCAYasQn+fSBhhrDSxErqITMYieJOqP5FnQb
         Fz+xIFfHe/huSpvmPRwj/+NrVR0JjG9kqopU2ZN3Anf8QDR+dMJEADdLAq8CbaETZCXd
         ZkOg2xzRmuTAbFKSlDw++chmCD1yK1Ag0prdGMgvypxfZV8HnM7X89iZmUF5GWzJDXEM
         VCnFmHDMe8BjOKbQdM2c1HXIGDvnzvvnnX/hqhoiH7AJywMoZlz3Wmcavgd6C5SvG2xH
         j/UI158sKEuGcn6UJvy/295ZdioSht1445r8qK8r11cThwpcP3MrxOoayFS4y0gS7zM2
         qiLA==
X-Forwarded-Encrypted: i=1; AL+hErHF8d6DsjSLFXHTIfabjZUbgtOeo7qzJuNzHPXwKrSVrMHSbmGOZOFUj9HtvqrbcMVQ20I=@lists.linux.dev
X-Gm-Message-State: APuU4Z8vXQob0XR3pPQjTWUYrLy/mrxOSmAbDsDLbgL22HY+pu9WfZ5M
	udLhBrD8E8XruSO6wNP/sFG+wE40oxGtUt7QY9sEcU8M0qF/dnj/B6xW
X-Gm-Gg: AYBFou1RYSCxgCCLYsQ9wC05+ZCYvYadumfgZUebNCilNfuv/50UQQGAWCk9bTgWTYi
	v2/pOvR9Rl+oKNvZfv6ahbWFXEyJr2Js2mCOCib3yDVELVTpqWK28vS8Zq0P2ODgEly5OX+muMV
	PvqljexXUviplNOwVIEcPhV/nwlRmxHfdF4dPrxMav3LEmDKS6EnazJ3r7OEaSuedlG5bZoqnXT
	I/J9o9ECAMUL40XNKaZEy1IXaYRvicxcEz7Cv5VAEnMi/aJtSjuqjj6wTyaNNOpTZxZJ4rAEKHX
	2cEZ+cZv4p8zrQ3Xp4u16vwlITMA3QinT//PEEXSrlfuhXdH9RdJROxkcxwnF9PNol3TLV0SRVT
	VPlSyMGk33dPZR0hD5XCe3to4y9iGnuY7mPrue7GveA8fW7aT47vjhu9rZhW7GeAZ+ePx39v5Le
	yDppGETOpGbZccfSs0leUiICw8FTu7/kl4tPAVwUk7EOqBEI8B2lrjHSLViCQnIINBI+HoCR570
	Wdxx7qHdBUEtvfgAivLCeLmJus08oVPYijf2A9+CT8xk7oIgOYeZqKZ+jz3Ro6i+aXpoCnCz42W
	BYIB/OuK9wsAUklngZmlJ81tSc9AxLVLU8v5M0sJgfmEBW+7ngqvfstRr7IEiF0nCduYAAbUj9F
	yIGhVsd06vYdH
X-Received: by 2002:a05:600c:468c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4ba0939b3eamr53551675e9.25.1794415063769;
        Wed, 11 Nov 2026 08:37:43 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm64559995e9.1.2026.11.11.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:43 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 6/7] zorro: warp mfd: expose the fan duty cycle
Date: Wed, 11 Nov 2026 17:37:33 +0100
Message-ID: <20261111163735.227286-7-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The diagnostic frame also reports the fan drive as a percentage.
Expose it as fanspeedpercent.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-warp-mfd | 7 +++++++
 drivers/zorro/warp-mfd.c                        | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index fec712b8b9b0..a8213affb153 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -33,3 +33,10 @@ Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Voltages in volts, with two decimals: vbatt is the backup
 		battery, vcc5v the 5 V rail.
+
+What:		/sys/bus/zorro/devices/zorro<N>/fanspeedpercent
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Fan drive, as a percentage.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index d407c786d44b..a438faeaa232 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -303,6 +303,7 @@ out:									\
 static DEVICE_ATTR_RO(name)
 
 warp_config_string_attr(boardname, board_name);
+warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
 warp_config_uint_attr(hwver, hw_ver, "%04X");
 /* board sensors: volts to 2 decimals, temperatures to 1, as WarpDiag shows them */
@@ -315,6 +316,7 @@ warp_config_sensor_attr(vcc5v, vcc5v, 2);
 static struct attribute *warp_attrs[] = {
 	/* RO attr */
 	&dev_attr_boardname.attr,
+	&dev_attr_fanspeedpercent.attr,
 	&dev_attr_fmwver.attr,
 	&dev_attr_hwver.attr,
 	&dev_attr_t60int.attr,
-- 
2.43.0

