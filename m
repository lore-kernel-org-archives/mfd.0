Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F32511E89
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750365; cv=none; b=WgdT5IJJBKduz/swN9zIEVkHvTOgOqdG4XZ3wLJVI0X3iUipznzcbtmxdeZ73pDHSeTW3U6t5NoFJzjfucA0CEZPV2DByI+Kijw5gkt1P3VtQrfZAdSWdCSSE3UdZA8Lro2FxN83t+UeOnnbz5Szts4UOccGl0g1Twia0j6WTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750365; c=relaxed/simple;
	bh=im7bHLtGYT9Yz0ql8qKBFhgsMiDZmM4stEa2+3CQjmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxCXh1dvEfbJerki0gDJ2xtCflpzIj3omXh+fFWPymxacsf6S4eg7KesvGQ/jjNMwyXYhaLlpsCuy3OFaKFcaRxYdtbC4LzYg2Z+W1o4gQvvEzcNmokwZiF4LD22+5xrtikgp/h6RzMGVq9UcqXuyc8vOIj+BPu9P8auv84tWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=j0EIqVfa; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="j0EIqVfa"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb7so103510885a.0
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750358; x=1790355158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UsHLj9guVGOwJ1+byqEfFywik/JH+zBDqG7OfDqa/L8=;
        b=j0EIqVfarAiC3xAXale9M4ol0NKliG8jRfVaGW5ornmrCdgMUq4Mxx0L8zFt/4SJrm
         dtYOCWgvg/7gwOBBuMymw+6329vY7etxJ+IrXHurteU2vlhLs1vtgjPTkMlyWxNaKYfz
         D6Aq7qKHxEalUgIH37UxLmbguRu1XSjMgE2xAU2ycI/tmFnr1qa3Och2ILEMbkEGuHQV
         keTeKhIfFAmDBkRfm0Hg5olfJUgclXu42CzqjPjdXcY4jBHCo805+7LjN/GgHd/xdji+
         tpA2g0davm6McodsxfCRzXkdhdW4sZknvxF2rymIz99/Ph2tz8FZFsOu4b6re4tN8xSQ
         woeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750358; x=1790355158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsHLj9guVGOwJ1+byqEfFywik/JH+zBDqG7OfDqa/L8=;
        b=RKFpAbJvnl4kA9CNnoR2CsLKxArJX30GLkbhx/lTZqUufICA8LF3qEumDntvyHdVIT
         cTY/C1CmA0Cdwd7MbcHGg6AacYJMcdLuiIdMQggRVkRHDclRdVHUsi82moJpwA7kASeq
         GrPDwfow3yNeiu9oBfe1k+E3/TmHnt+R01c+Rpubkr6YxWkxoZc48eCTZf3iyC9DimLa
         vTquT5ILiTXYjFP8sp9q+uBZscIQP7N2Qqkm9QfzVYIaJ+OQaJY2VFgLhXg/j+6SqRoJ
         wvw6joqaKJ4b5NidPrqV5K8yn2fzyVmZcQMM9uNnG5H5ASQp+1FiVSlLvE75qXgOIr6C
         yefw==
X-Forwarded-Encrypted: i=1; AKwUvBwilSiCmw64p4nvcvamfN4gqxyJQC/18zvw/Oe6rChQZqW5SrX59t1KESMlW5hXBI6bGRI=@lists.linux.dev
X-Gm-Message-State: AFuF++nHeQDOMaPpWKsKCJpdva92yqyzHpRgrwF2hiSxzYYmy6YzwMuG
	PA1BKr1Vs4NH/FneJ/f5FJILhS3auZxVA/N3cUDE14EE/cKt0vAqTuwR3oT6vFAZvIs=
X-Gm-Gg: AYBFou2AqkYekm2LWrDjdRmzMfLXlIORJUlcFOCaPByT6o1X1BDQpxTC3TttBLeBjOP
	OplbH7+LpnyVJ8ENgjy+qbues2eBd5AYk1GvSCww1asGd+Y1vPuKw7Wv1J94ru5y3V3N0CZ/8Fg
	oVfsFo5O/u2xW/LIA4ugvrZ+QPagURe+FFvR8JvTdZHYarkmpAKjFOnXc5n/zl1SCDNoCEc6QcF
	iuXNeGMDBv+tnGyN+FVr884AJbmqIIdvDag1w+1GUmmcXhpf+XocYlaGo9lafK2geeWnagihAjK
	2Yx/MDIIvLN2Qb2w8yQKnJsU7dmnQQJUUwWt1uwMuFeja4H16ULTswNzcRuhajeJuLYRjAo37vU
	XCpvtCpXCE+742hlyDUb73S8UsF9L66qZKUpz9YF7NCttu7xKwIqDe0+ymSp2A+hJFbp7vxHIOD
	YcQXJMdrcyU4ItaBukl2kZJBrmc7x8JMAJCYxRtH8sUCKAuuxq7DESYj8coke64/yR1rirrekvY
	pk=
X-Received: by 2002:a05:620a:a0da:20b0:93b:e412:8cee with SMTP id af79cd13be357-93be412aa37mr210118885a.73.1789750357966;
        Fri, 18 Sep 2026 09:52:37 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: introduce TC9564 clock and reset
Date: Fri, 18 Sep 2026 11:52:29 -0500
Message-ID: <20260918165234.687224-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock and reset controller present
within the TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both of these PCI functions provides access
to the registers that enable or disable a number of clock signals,
and assert or deassert a set of reset lines.

The TC9564 PCI functions provide PCI endpoint buses via devicetree.
This allows a PCI function to use devicetree to define subordinate
devices accessible using one or more of the function's BARs.  The
clock/reset driver binds with a device defined this way.  Only one
of the two PCI functions is permitted to define the clock/reset
device node.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/


Alex Elder (4):
  dt-bindings: mfd: introduce the TC9564 config syscon
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock and reset driver
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  64 +++
 .../bindings/mfd/toshiba,tc9564.yaml          |  56 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  22 +-
 drivers/clk/Kconfig                           |  11 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 366 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  54 +++
 8 files changed, 582 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 79d34e34e9ab629be19e588ec2eb7e1855d6dc46
-- 
2.53.0

