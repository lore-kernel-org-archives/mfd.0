Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFB3C5848
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698024; cv=none; b=CpHXXF3Coj+eOhuiDTWz2QmEgW4bDmuJL/eD0AIx8mV5adHBrpiZWLlFctRXva0JhJL0WPr4+EkcoohU7CWzQueCMtuUu9mFP1iur3JSdyeAzcg/ZuHiGmd9RsDT/8rs5zA+kXMHCOJ23CWBz8uIHS0Bz6/fCOD4ihhRXONTalM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698024; c=relaxed/simple;
	bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPqXJbK7+7WzUe36JORITHnEyfyT6MzFhd5ChWB6yQ3Hq5sy9C/+pAl1fhuSNLJ2gVRjRoFkh7728zfGT7+8djrPGXpYXSH/U64gws/zluVqYP9X/TIVnsIN40GMuiUh2+l9LOn5T69V/KYWUDqGsuDgxFhcihT+0wVF07DgQs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6Hwklh+; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6Hwklh+"
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a4492f5cd1so58359b6e.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 19:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698011; x=1790302811; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=P6Hwklh+d/Ehq34HtaRTSRSGit+XSKgiiWRnF/ZuZLUk47XYd9NDXHVe4r+s0epDTh
         ZKk0vxio07HMDwGJmesL8zXcov0ydNmV9sAMPjhDwXU3YTU0LIamStlg13KJJKadhK3Y
         LHJVSFPYlZtqyR7M9TjUVUQye2LLDI3Dajjm3ZxN6vXg+b8X5G7pp2x2+Qs/WuLXuaLd
         pazSNoMdz6VZnhG0PqjjKbjfxNdsipn8ODUYAss49lKQPuIeix60tu9KVoGhnfQb12aI
         POoRgaZcb7RlQkCqexJqzdwp85aItry5eH3J571eJ9OqXA37Wq5iOUMdTUw2BwpDBlI3
         BFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698011; x=1790302811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqP4V2+10gRQA7yGYe82IeB5bWtXD1MRgeLzqXm0MrQ=;
        b=asrnXUhz663nvfPH69MxIwNqQmZKXRa+OF35PC0qCZWmi7hLj21MGhR6sZy8jTZzZo
         SqXQ+Vw8XYlS9OwrqDYzQLFxb76sSrk5hUHj/n1abedNhe2Pp4vrhWk2bMLZXyrHYLYZ
         +E/2zz34lt72Kfkz4l8xuCC0oIMqRjqm0HQfwR1I9S8VcXHA3rKldH/wpQ6L4pvMjFF3
         Jzy6s7Ic/3mQIv3WRhuHm+o5m1mnyeKpBk1kaMgxL3QPa9lKG3jsyzrFb+0IQgiSY2kq
         umekIZDmV8N7lBfu00D2BmvHbbrZuDk7Lbt+mbpEmaYocYFdtwmj+njKVZ9LHYo5vxyl
         YgzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB1FjGW7wduxylkEa8yMZYoBK+noHi/Lmj/wKfLicOb4mn2hUVDCQTE5CGSg+bpMrnhrg=@lists.linux.dev
X-Gm-Message-State: AFuF++mGyRcSjNPDO1cBi0+5fb6Bu3iZuAE6GK4rQZs4wbFf5jAfmSct
	R15BymX3I2iaHhFx6lPEKadKmx3y1T0B7zFsEZeZIS6gCc4H7iEi/KJQ
X-Gm-Gg: AYBFou0KWWuc5BlP/9fX7xmb2GvXTTVqwyFR/BFU+tjQBoQ1+GyOs+gdc+BFo9IGFnM
	k+o+zuTrdXpuGls0peOYPKEVuNQQCBspIoLc7hUPPHh7+Eeb4dxbBKUnyesSvc/AnE7Ps7x/mTi
	pMaV8HCjRgj+M7j217oOzT22iNuSZvarKLw4R7wCPm8cqLgYmrHBgjF68YAiIyrbKg70J3gwc7h
	EW9xcizZ81F6UHvxK9qC8njoGglBmie0xtSN8qiNVx31fSB5Ik3QQcIbvOidXTalvJyogFhdY0F
	uSYRWRnGnYMrgxi7zpOe4u6EOBopK4TQrLX0QQKi9UsAeviygiew10CAXH8PPvpMDOOdaGRil7A
	c/X/3MY0zJdKXfv5ilDPPIhGdoXOSbXR4A5LhoJvo+2mV3Y2uuQh0B1bfURc9K9J1dYHeZUWFfO
	EkzTi339Pi8VKjobupBZaT5/EALvPTxGsC6Q60F52ibwYR3ZBDztWIYV6FAJ/GcT9o2Q==
X-Received: by 2002:a05:6808:3094:b0:4c3:2e7:55bb with SMTP id 5614622812f47-4ccf977b99fmr1600319b6e.38.1789698011513;
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:11 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:50 -0500
Subject: [PATCH v2 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-1-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=2681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fwlPkqstrQlpYtzSAbjI/xkIKHHpjI1afmv6T7fC7po=;
 b=miNvqU66NVjsZoTcnVnB/kgVEaxWAqjFh9azbHOFtnGSnkRq1eftd6rcrmBB+2/4rlXYfBEUw
 Zyvg/aMLPnkBOPbEyLLlzDeEXx4kS9ytIIdtF8pPiaejam11tPa+fMv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..41d7b3a67415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16713,6 +16713,12 @@ S:	Maintained
 F:	drivers/iio/adc/mt6323-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0

