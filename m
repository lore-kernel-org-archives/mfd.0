Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9954B1C4
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872883; cv=none; b=WbUtutcp7HU1VdymvEJVryk1VC3vpHNcOu7uIz6BDg3kLwr39Fr5PsrOZDFjRpHO3uozeZRBbIdDzsIfX8VQVPcEDL4FNuWR8LXmjCTaUpvG9dHdg3NDuXSdxBoH32fiWAaRS4hmv3BysKxA9pAf4yONbHSwZFJgCIQniMRSqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872883; c=relaxed/simple;
	bh=cw2N3W41LXIl6pSddh/dl3HNjG7u1Myg/bxOr7qfT6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yz189B4l2SzJQPg8MXXzFLlPbaQ2b9mWFpOO6OlpwEuSbuuJeQqhmc5msa5T/G+yq+3JheFojSBiN+0Kp3zogT23UQrsOrGGvEK/GOZVkq3amvpm6xUmsXWQKlAOQ6F92tdvFn7ee+cElSjfaSD/XweW2Pz2zkSvZHzEhz9TjAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TukY28Uw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TukY28Uw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so36298385e9.1
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872878; x=1789477678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc+P01fTvqlQKKHP8oo+eSTRJiBil/x3iDFvTP+c3Tw=;
        b=TukY28UwKefZWXHE4JE8wHFDYvO/hF8a0r/wZbZFUXtGfUr7NGm0BRJKq5vBGvccpy
         cbK2/lBjmnfNSL0HHVRXi6ZQcp4kBQv0BWyYocdyczCtsDFKPQZ26ZTtY4ZBp8Wha/yY
         2CAueJx0q0Bi5O5m4w1Z7QonCOJsjdW9ud33otsXtYE8wn+z+lw/KUwGcPT4CUIQJ3/y
         KJ1Slw3y4pj7Rv4+InEh2meBeItDFUCn8EIFSAsImTiOoqxDw1xl9pDwFRac1gSuQ4ON
         5r25q9kxQBV7gBi4sXbNmdlGf1aYX1A9jRM4jCrhjFoZm+gm2fUhq+UIw0PeUFgZM3Ef
         KI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872878; x=1789477678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc+P01fTvqlQKKHP8oo+eSTRJiBil/x3iDFvTP+c3Tw=;
        b=fjKyOzugLBhgUievKh8WTLDsiTuyz/kDIQSkr/Vq43I1YTZ5M0CB+M02MsWvGIIsPN
         b8HqC7xHDeGcL+1l6YoWDsUOlf6n6/8mxG44XxxJ2503CmM/65Fr6DIKcUcrhHWK6dUQ
         pH/KcES24h43uGWY7VksChG3FdPJLKlu5cc6vST2HN68PHAKnWycKx540n6am9sFQICx
         w9uxke7kMqWdsFGd0UaRFrV/2XBvBw2pQVeYKygRLgGrklugUgtwMyyqjkIAGpsZcHOY
         xFjWOgWTwrupw/FhGNtQV7EjEiIeusnjQA3wPVPHdTNpOei76bEzLeFqoBNqQV0Dotdn
         WONw==
X-Forwarded-Encrypted: i=1; AKwUvBy8uCcwjWfsnYS9DHkOh3TjHx2842Lj7ajq4V1Ruky7N7buZuCljrqkAiPfOQhrvZDslwc=@lists.linux.dev
X-Gm-Message-State: AFuF++kHXybABxH0lOPtGqwerlA3sRiT6IpwoTk9LC2sd62NDQMve9uU
	49DEWwkGhqsq+xDaQrSs0lExdTWlkjFu4lvyF43oFKO+zx/Bz8qTB1J1
X-Gm-Gg: AYBFou3xgiuMiO2Bytm72j1/STTilKPFbe+3RXQd2+m11nvmfEz2wG5oinRh8V7r4Bu
	0go/SSYZnHBZOx0As3ZzA57p9PpJdax3hN5LA3DxASXqOUE6+7pX1NBZu12Ya1gXkxdYN6CY/30
	CA7A+1SsW/PYE9sXSNK0fYpkoMv2ndtDe9Dgu2ZnKvoKsIHLQwGIJfhCDXf02eQ8uYLmpxXXq+B
	SxMCrfbpUfeBmtpoPQmYiiHg8pJq0G+orjSX6CJx49R8rhkv4VfkV4tJeeiEpZb/bAn4vC/avuA
	74ggVC2kBOKULCnuTJRP5lz8ThKJ9lCV7RkZL2Xr4JCY2Vggtf/8oTlEiZubpAoACbdOffTRexK
	GqkQtF4dl0pDKzZpF/j3xw702EZmjSw6NbzImGw/+uVBhNaaRul6dzPSvZTKUSrbb3MNbU2sRWw
	uqNUT/SzgPIZE8HQI8zVU+t/JVRW6ZHrSEi5qukFj/vG9bhjICxHX47oEdEAQpvEW0c2aec3ZWV
	s8GTZ0hF9qoMELpp02A/HDRJ9RZN0LqN/iJ8ONCYbBl
X-Received: by 2002:a05:600c:4744:b0:49c:fc6e:a3e0 with SMTP id 5b1f17b1804b1-49cfc6ea75amr279617375e9.31.1788872877979;
        Tue, 08 Sep 2026 06:07:57 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:57 -0700 (PDT)
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
Subject: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:07:43 +0200
Message-ID: <20260908130745.2545-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera PMIC on the Lenovo Yoga Slim 7x Gen 11 (Qualcomm Snapdragon X2
Elite, glymur) has no interrupt line routed on the board. That is not a
wiring omission - the part has no INT pin brought out in this design, and
the sensor resets are driven from TLMM instead.

The part is a PM8010; this board describes it with the qcom,pm8008
compatible, which is what binds the driver touched here.

qcom-pm8008 currently requires an interrupt: the binding marks it required
and the driver fails probe without one, so the PMIC cannot be described at
all on such a board even though everything it provides - the regulators -
works fine without interrupts.

Patch 1 relaxes the binding, patch 2 makes the driver treat the interrupt
as optional and skip the regmap-irq chip when it is absent. Boards that do
wire the interrupt are unaffected.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11"),
where this PMIC powers an OV08X40 sensor.

The DT change that describes this PMIC is not part of this series; it lands
with the board DTS, which is being upstreamed separately.

Oleg Keri (2):
  dt-bindings: mfd: qcom,pm8008: make the interrupt line optional
  mfd: qcom-pm8008: support PMICs with no interrupt line

 .../devicetree/bindings/mfd/qcom,pm8008.yaml  |  7 +--
 drivers/mfd/qcom-pm8008.c                     | 52 ++++++++++++-------
 2 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.55.0

base-commit: df2908090cda368b01ff43709f51890076c56157
