Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993527;
	b=v0QWFP/IbJYCoG7Uj9ez+D9GhlpO9hX2Ya0paBkAm8B/yavjUy7NCwPf7+WE5IvcPGPW
	 imjxxO1aEJycvGGaI9MxaDf/uwmo4A/de3RI9ggQUrdeNRLdsp8FCWlLr2i8FY/1iCwe0
	 CHtFOOxZjNQNUd5Aqc0t7ev7sjamyIoMNwlmmj993+DQlRQUgkovHuxshQCV8zfOKL3P3
	 AVO7rOAKR+9pJJXEmUdE2iFer2Nk9TxF0pPqurziL0WUTYP/I+TaV2ow7kD6raRJT9IlK
	 Q2w7OH+qPRJSKqhZ5irt71VlR4KIBRqKfrgiltuW6RnxMW0865JF5/Tn456LCvyzA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
	b=kXg6YHyBeV/bkYf/DSzgerYcyh8deBvnGa4bajbSOh35knqt4LgeuATloy4RyCi9CxjK
	 8QbDPQZxFQObCZGqHwim8jIjNufOlM2bDW5sCXpUcSqEqt4osQafIy2v4n1vp0190UtEl
	 r44Hijc3SocRqOODcxGHP1+5T0MRsWNxEhMNkQuNQxvuSOpLe+Ex/lnUymIP+qxwE0NZ1
	 Lw6q7U3DChn7s/DEsKYhSmB6qqL1JzoWa5mmAEvXWkpJEH2z4xK1nmCu9tW78xP7tUsDR
	 wkBVMATliCZIYMH3BSWmyTRyngzL0TlonY6QqHOrFLxw9AJ0Scfxcad4MpLl30dv7mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2trcZs9;
	arc=none smtp.remote-ip=209.85.208.198
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE760606A32C
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 19:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE760606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2trcZs9
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab357a21adso5355041fa.3
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 11:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993525; x=1794598325; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
        b=A2trcZs9Pl261P8hk1rdZPojDfxc2BFPx2dyFo05fhOsKn+e5LSvmc9xbgyhJi0bE2
         poGA3kCGxvQax2JyUA/9s+dh9F4WAj/CbFkRHZE4JP8+SC1Hoyc2fy8s3ZxB8uDnmnMi
         iTZRt+yZZDr0WkYNHTGkz48eia7y8Npwem2uzFEA9WsPwsVrbRAJJh3h3qtU6FGd1uzG
         H672JawNRbHqcX9FE53qYqNV1RzuEfMIH3D9RlbIkfvuY7dt+0kn87MzUFK0EIPPn3vi
         0RidQyBIEkssAUXEMmuIydQ65pgHZ+vB76iRy+9ef7+V6eNklre5Ql8IFVtza7fXkK3i
         Jbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993525; x=1794598325;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
        b=d3kl6r8Qa8RQrkI/Q0FYcc02NvlkAK3ZV1hlqoK+3eGlYYTb3rPSH/7Rb1W7x+QcGH
         aY1ZHqoKNdhs8sPpRemlTrlyFjsLX3OsJKMW/CDh+9VrcK2bKCkbbEIlhnQcatT2bphC
         n1y04WVDG5ZopIGMHGmc8WIjWYrm3LJq6eKNFapQHtsWpw6QrlJt2WIU1aQi882kUU39
         Z1nPJQKbNqFKdAEp+Is/e17B3KdXyaGeAFDUOkqTAYct8GazoIudY9VJpTZ/B+XSl7BM
         SADY6Z1wTvAwKpnSTRwyjzzwq+qJNm/Wb0AVMK24f/viPOKgeOGzuI5zQ6I1jDPh8xAz
         AT5w==
X-Forwarded-Encrypted: i=1; AL+hErFz9rqdz32w50oEtAFA/hC2YPY4ZxoUTIRz4ZCeQwn31grFjg4O+u1uddT7Q4xgGNdglZQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9IjCQ7nxh3YpAeX6FWwqLl2XVkOu5zqK8X6kDRQRix/68WQzhI
	fN3pKzj964zngWPFwiY+FrpvoWkeCb1DW4dPL0fN+YLVQuxBNJ7sEWC4JRX+7PIIiBLqUCoInuw
	4BC4s94HDSg==
X-Received: from ljgi21.prod.google.com ([2002:a2e:8095:0:b0:3ac:f040:c4e9])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:31d1:b0:3a9:7e4d:7fc5
 with SMTP id 38308e7fff4ca-3acf3b2f8cemr7731911fa.18.1793993524757; Fri, 06
 Nov 2026 11:32:04 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-1-dbalint@google.com>
Subject: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds the ChromeOS EC On-Device Power Monitoring 
(cros_ec_pwrmon) driver to read onboard power-monitoring ADCs,
such as PAC194x, wired through the embedded controller (EC).

Several ChromeOS platforms are equipped with onboard ADCs that are
connected to the EC via I2C bus. The driver interfaces with the EC
via the existing EC_CMD_PWRMON host command API (and EC_MKBP_EVENT_PWRMON
events) to manage ADC accumulation and expose accumulated per-rail energy
through an IIO sysfs attribute.

The driver is only loaded when the underlying hardware feature is present.
The series also fixes alignment padding in EC_CMD_PWRMON definitions.

Daniel Balint (3):
  platform/chrome: cros_ec: fix alignment of ec_params_pwrmon
  iio: adc: add cros_ec_pwrmon driver
  mfd: cros_ec: load cros_ec_pwrmon on supported ECs

 .../ABI/testing/sysfs-bus-iio-cros-ec         |  13 +
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/cros_ec_pwrmon.c              | 333 ++++++++++++++++++
 drivers/mfd/cros_ec_dev.c                     |   9 +
 .../linux/platform_data/cros_ec_commands.h    |   2 +
 7 files changed, 376 insertions(+)
 create mode 100644 drivers/iio/adc/cros_ec_pwrmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.455.g6c5a503b38-goog

