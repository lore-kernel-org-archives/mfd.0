Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4B21A453
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532132; cv=none; b=KKXCwflMhL0GQJZZx2TzxtY0oB6fYBNVrlJWMc1dyBBaqiVv9dNJIKQiAw1GfDMxl/RzOnRU+KfngMkcirHTSErf6kR4PiY7NpIeWqkZ9txYb9+8HEVGotHK0s3kucrOcETr4YSfDAXFPvOfqxAAE/6NlFiw6qvJ1tqCQOelXFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532132; c=relaxed/simple;
	bh=1ZhvOrKcGislD+WC+8Q4vWu5z8pTpCo7Q/Gsjhr1d1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nRBt2nldpDUX68f/WttPU6Z3WRU+LbMF/eD5p5HFqVlqwB9nx8bCxmvL8PWk+IdxVJfLumlLTQesk4N0hrnrWGB7aqvjNqJBYDXCoxfcLkGnEP3gQsa8DhTgo66nF91iD/qhaWo+ax0MJU2VJme0doaeKSk2aFndO8AmnJDpZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoXTsqlY; arc=none smtp.client-ip=74.125.231.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoXTsqlY"
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-7f9cc0e524aso1743489a34.1
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532129; x=1790136929; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=YoXTsqlYO66iGBljFfJEyc96fkdkeIFYN0Kfs9cgGQCN4NEaCfMdUEqcKSLa0ajgwB
         ZwMzPyiaTh64uBsalRBBCYKXWtR8nDrby3iLoPR0pC17AMcxrwwPPpdlrMBbVYD4OquN
         O7TzksAnDxWF9SAqWmYxhL+taqY0M/JyosDJY9zr3WS0RusZGvkgpkU29WSRjpEC+svJ
         gS4zA+yOIoXllbpp/JvTjACHZrv9PhrFFQKqVD44gBYc/ub+GEvJn3fe6sJ4CTWoakGE
         ySzkY4ChQBhvg2WEhbTbjaN0/ZurlIVPk2NyEBKN/xiyubAkNF1Pqpv+QQYmFhpdmAIm
         OuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532129; x=1790136929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=SfDnftQHv02VBL+JIFYPjei6IVjK6xpqgNpFY6k4a02zAvjjmn1G0rx0O3ZGJlXIab
         Pp8Rn17taWzCHCzyzrSVl6SAgHu5Wv2Ed9ix6PI+pU23stLba/x3PkmcXs9CL7t4fVSz
         ivMIsl/JByJspEqL3/dFGnGt8dHf4JfsXtosLqxi7eAyX7dFLW9OYTjUQ2O54FEtw3Nu
         J0O7IOr6IItgvsOfzDWbhSAIlu0lya8xPKSQV2UEwh8UME1fq2CNViboYIO8xbvYMggN
         vn3VtWoM5zK3HPkIS1x+VHy3k1jR73kzN5hXmYKkwVvWDMkrB4Gdfu5NjQtBRkD4hi/4
         R4hg==
X-Forwarded-Encrypted: i=1; AKwUvBzRaKXSo379hoP7zixkitQLr496unLxMsBW5w5W5SahkfoUjGTuW5upEjVKJnVwkWevPoE=@lists.linux.dev
X-Gm-Message-State: AFuF++lxT04nbif5YLDcG40vRB2ajBPCWEWsf2nl9czQxC62T+kTDyXk
	EkhOSnXH1Zn5BtimGjIQDSWwsU/R0rVisLyyr5d9k8cl3EfrOm4SuA+n8mETm8AY+8c=
X-Gm-Gg: AYBFou3gO/s5PkuTaTSK7XR1Iqqt03JumsP6Bjj9ZfR4ezCc8Y6XqnGxDf794jEX3CB
	Pcs2Ah40dDk/ugnL0iotOnCZKRoKxDX0GB7KiCmL0W68wkCKECqM2IX64taSzomZf6W6T/Bxjb2
	8+lF0wGHX70vgvzs/6uPhVC90fT7D8w9BCZp8ZrgS5mQA+EzwxAvVHWJaorbQ4jRqK9EsdF4C/2
	EU16iNp6cmAnpdr6ndli59GvL9PCznBI6YkAAZPRZm6KiPxffbcAyvRfE//uaCPAEharezXMA1U
	vWPUmcAqQVmN8FgRkOq3OnozLfklqe55rsiZPd3xuAQm3P9VxRyMpHP0Rj3E5YrKXZsfdl/gRSp
	znHEcpOiZa+QY8Gi+5M7N7FOeEt+VHhNGf4paV6NvjH9lGVYN4PlebObVhhC/OyiEkhjE1WS4zT
	1p+2i3eLTqlXK5FPXENzzO660eHSjeidFow+viYUhHdhVt99IoFESk/XmO/GdyZ3yYyomzligWt
	ZTzRQ==
X-Received: by 2002:a05:6830:6af7:b0:7f4:eb7e:c8f7 with SMTP id 46e09a7af769-80b2c18158cmr1482766a34.5.1789532129476;
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Date: Tue, 15 Sep 2026 23:15:25 -0500
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQ6CMAyA4VchPdtkqw7FVzEe5ijYA5O0zBAJ7
 +7C8bv8/wbGKmxwbzZQ/orJJ1f4UwPpHfPIKH01kKPWdf6C+tLCaIV/WGZblOMkecRpac/dFWN
 ZY58wsCe6OQopOKipWXmQ9dg8nvv+B56DRSV2AAAA
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=3814;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1ZhvOrKcGislD+WC+8Q4vWu5z8pTpCo7Q/Gsjhr1d1M=;
 b=hy8S44J3Kt9/i++nBCcDmWUBualfD1ZRDUrk1YbiwxToPcudFRBPrKHFN4YfXcOFs/wkiAGTH
 L6vgwManOMMAClIr8hluO7RIvzaIEMuHuNUzkqJgQwQVkFxih5p6Zjj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
reach. On boards built around it that ADC is the only path to the battery:
the SoC's AUXADC is wired to board thermistors, and the charger ICs these
boards use have no ADC at all, so without it there is no pack voltage and
no state of charge.

Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
the header naming the channels, patch 2 the driver, patch 3 the MFD cell
that instantiates it. The cell comes last so that no commit in between
registers a child no driver can claim.

The mt6397 is not given mediatek,mt6359-auxadc as a fallback because the
two are not register compatible; patch 1 has the detail.

Only the two channels a board needs for its pack are described, so patch 1
ships a header naming them: a channel ID is an index into the driver's array
and not the PMIC's channel number, as in mt6323-auxadc. The register
sequences are the ones the vendor kernel's pmic_auxadc.c programs.

One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
4/9 [1]. Whichever of the two lands second needs a respin. Mine would
become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
first.
Cc'd Luca.

[1] https://lore.kernel.org/all/20260902193351.185771-5-l.scorcia@gmail.com/

Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
channels are exercised: the battery channel by a fuel gauge, which reads 817
counts, 3830 mV with the pack at rest, and the thermistor channel by an
ntc-thermistor consuming it.

I have two things in the driver different from the vendor (Amazon
Fire OS based on a 3.18 kernel). Verified with over 150 interleaved reads
per setting:

 - Leaving the ISENSE input enabled between reads, as the vendor does,
   makes no difference to the value, so the driver switches it off again
   and leaves both ADC input enables clear when idle.

 - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
   samples and costs no measurable time, so it is left at one. Software
   averaging helps, but only by about a quarter: 0.92 LSB standard
   deviation for one conversion against 0.67 for sixteen, where independent
   samples would have given 0.23. Conversions in a burst are correlated.

The reading was checked against the charger, which regulates the pack to
a programmed voltage in constant-voltage mode. Over twelve such voltages
from 3904 to 4080 mV, and charge currents from 111 to 778 mA, the driver's
reading is a mean of 0.9 mV from the regulated value, well inside
the charger's regulation tolerance. That also settles reading the chip's
trimmed result register rather than the raw one - the raw register is
20.7 mV low at every one of the twelve points.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (3):
      dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397 PMIC AUXADC
      iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
      mfd: mt6397-core: Add mt6397 AUXADC support

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6397-auxadc.c                    | 340 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6397-auxadc.h   |   9 +
 7 files changed, 372 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

