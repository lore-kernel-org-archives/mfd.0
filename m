Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E752552923
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872884; cv=none; b=Q2Zngfv1qYXjaiB+qeImslfsXvvbj8nsKyieqKe7kehexHPV226zHi1nMEOPJS1GQqbJBDJ3NWu00NbPX0ZEl2Ee9KTFpfHdN1Wzzq2l3Ogk+8Hh6JoGzD5sk7jkfvp8Yohjz/qDVcBRD3guwAYPqJnhouKLNPxAmfndX9or4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872884; c=relaxed/simple;
	bh=gkkTYq1OpW1LdtRjfwsi/bJV0O2wt9hs+XlnNEqqaw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM60vdE8Bp3bj+9PQxyLwxpfhjiuNPgsn7nm8+sbvr7/69qJiCMvdwnVG19Rpv36MdolBrLr0Xo9eWB34elIs/9Z1xCNBH2d+nMyDn7MyhrxCKmDVFYDpkdermlgBrtiGtEbP0+HRSzIHwIV+2vyN2aVmw6HdtPrOR05mYrMiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhHWkY5E; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhHWkY5E"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso3323016f8f.1
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872880; x=1789477680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zK26D4c5pgQKL2UdaReKAoHDcjPjh8dzU2JRSqnNNE=;
        b=JhHWkY5E5BV0ZPxFt+7p/2mYj6zSoJTeVbcAxowM46rkwdjXF+LrUO7Z2T3K18undh
         Ri7QdjywRHVCBLEHr7FD9PJFj+6nHYpkz1s4givnfxZfKXSC95/IJdKqD9X0S5uAanr1
         mpQ2onloj1UHCYxJFV+OTukecqx5VX2SMaq+V67TyMDgW18NVY0oEWuhGg8tNp8evHgD
         UepmTrWJ7gL/O9pzTxG2P4Tnq8DTFxJDvpHcsVnl68UBZINtrW2ZJcVu2z1blwzzUVrF
         Oaw6Wly8uqN2yY4xrMpXNDL9/1i2oBtMWLJefLWuXOkcu/Xp7dC4ul6RcCqwzMNGcsKo
         Zziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872880; x=1789477680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zK26D4c5pgQKL2UdaReKAoHDcjPjh8dzU2JRSqnNNE=;
        b=sRRpMv0MiJ7OJrt3J5CmWt1Ndba4wh7Fkagjtm97sASzZo6tqwP/q2Br/lE7PqEqOr
         kZMM/IMs2hDbH/s+Oi5iUusShxqJOfeMjk+QzidoBjlPb86Nxf+MmQWXW+j0jOhazrpS
         GQLD6e8xUAl5MWAlHe/sCJcXcUWNbQys5pnh3hQpvbe6rwfFYxT2HoR3fzujMQl7jICb
         aOs5N2JHTIMeLGLgIfTbz80O7GDk2pUcTtgtMk2O3ZCTvr1BjjlwGksZU/sw/fwZkRPL
         sydPGGEqZcO2YjHx+VfdyKy7W44gq8vxXpz/Xyn6llEiAFUMGxt35mAVaKI8xJRsCo4R
         r0Kw==
X-Forwarded-Encrypted: i=1; AKwUvBx/rYcONJfzS2wtjOyny7q1uAPneH2ZT1lpF/JGTRiX+qEHSxa02I9qOaKaeAkCjxD4v5I=@lists.linux.dev
X-Gm-Message-State: AFuF++mjIMSkDd3ON7I3Xoq7I9gNfcOGtWzw1uIQZGxvDLBJB9z0dExM
	SvHp5agWjucuJuGX7HtagUHDHOTFDkvteA6nRPp6gXpMN+cTWO1fJ2ua/nls3dLTJfINCA==
X-Gm-Gg: AYBFou2RTuBjZQIhb6sX+6c1GHu3VcRvJpvPntSFn8PH+G03SfrpodgCSRV8lkL8qcx
	qCznh/2RnvtKfDafECCgz+/MGq8qCiRdB+eBG7Xh3LdFri4nhuhYi+wFtxpVPWZX02FP5aqaf5V
	sJhmR/aZkP7XEDmbtiCnXtGvgC9hDS0lKNZa7La3H7bzslhB1YtwIYlrWzWtgxZ76iWmTVx6ZrM
	7OeAbwMz4L/jNFgfnapPHQ/J9vcSVCus4SDB86vLpuJW6xG0xifsSQUpUDxhd3kaYhRgc5kBoM9
	obuF54+MlT1Ne8RWSSmtDR8RNiSUYOld1Q8MYBa2W/kbOpvtgD3hbPQXsfsU7eaBlOUJf/9GVMS
	DuFDhNTI+KfT4mjYYOdDqOnMj5N7N6Jwom6xw9LJ4yjES+EAbVk4xlcNyRdMd2Pr51Kpq/LcHfq
	YKYa3c86Ywf0Jb3sNKxBJsxvya+83U6JrUf5EX392pLDI9LWRAu9xQ2OUxR/hnG+l6mX4B9g3mZ
	I2yFDoPS5JQS1deExZEUfQHg29zidLLO0EsmpKEaV8=
X-Received: by 2002:a05:6000:610:b0:485:82bf:8728 with SMTP id ffacd0b85a97d-48586e32b7amr34058783f8f.0.1788872880038;
        Tue, 08 Sep 2026 06:08:00 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:59 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,pm8008: make the interrupt line optional
Date: Tue,  8 Sep 2026 15:07:44 +0200
Message-ID: <20260908130745.2545-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8008 raises an interrupt for its own status, its temperature alarm
and its two GPIOs, but the pin does not have to be routed. On the Lenovo
Yoga Slim 7x Gen 11 it is not: the platform firmware describes the PMIC
with an I2C connection and nothing else, and the vendor driver talks to it
purely over I2C.

Drop interrupts from the required list, along with interrupt-controller
and #interrupt-cells, which cannot work without it. Add a dependency so
that a node claiming to be an interrupt controller still has to say where
its own interrupt comes from.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..db1592e115e8 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -88,7 +88,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -97,10 +96,12 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependentRequired:
+  interrupt-controller: [ interrupts ]
+  "#interrupt-cells": [ interrupts ]
+
 additionalProperties: false
 
 examples:
-- 
2.55.0

