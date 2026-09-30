Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A1456E04
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752530; cv=none; b=BCx3EBtC6jCWyipiDoDdg65Ly48a5iEqOFXLarSoo4XA87yka4ny6SbiU/bSe3dIHOkUxGGf0J9xA8omwHFHeMhG4kQDfdDA2nQUFGyIOQIN3qmiYf6wotklnBtJ3vbvqtbWvSd2a+Vp+g5sTv6L+yxJlezTNV5eXq7cR8XpDvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752530; c=relaxed/simple;
	bh=9++OyGSJWEwT7/ctMO79NTROZZy/+9e80noaO28S9RA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RktJP3dvd8WzBQKfeu7Dz8R/h/Y/B6D7NnDDRRNyMtIQkKyg2VZNCIwJ8YXsXJM7gcOD5+UNtthZKHBV88oS/6lzOtrxYKyRg6RKJsxJcWMnVSyGFViJAaHdbRFZthHNz9HzvBb7+F4cexCp7ORIGfIIC9horkPCgPCp1h2YSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIK6iJol; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIK6iJol"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso15188375e9.0
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752524; x=1791357324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=qIK6iJolnsqPe3jHBn2Qw81OH7Drh3w7ExYIJ+y/Obo18pF3WWSlg77Y6TYTG0f4Rl
         hMlsmGTSsrJNX0LIJ7y2w0GUbkVP/ft3ncgaAipdyAeXt9Y1/2gmAYwsxu3hNQ4sZL/M
         ZcOJ/cFCGIxXGGsbrGIapdlBSSczDlzEu1NQEn+MFsYrQVHk6Sf6eh1k3H0/18EEK7Uu
         +mCsWSWVxqcOQQp+WuY/be+ZAqqPMarL1MP1+KD12a9opUZ/wMyzHRLeXI6QT4nfGg16
         9B6/snDXoue/9wKltmXUzJ7Iv3saotcPvpgol3mD5lrqb/h1v8trVRn/WGpKTV9ib+Ri
         b5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752524; x=1791357324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=1Ec/VE+gdtwr1609hAnWMPaGhGULpjtegvhMxYUCTvZEXRwugW2lporTpwsDCQUnym
         DW6Tp12BKR879onci5bQm9BzJ5i3KXRM+Q42PnWbGWlLFYCbSNzcpEbwlT3/dMjlpuG+
         HUZNCuPuAPRfYIugBml1HM0anjldp2AWa7iYK9/dq11YFKAFa0GR1WKTjECJNL5lzA1Y
         s5jYzMd1C5W9DaPSdCAyATWZjR+YvkuW/nTlmZ32L63/JEszDHayv710u6L6XVQzliTN
         BxDmdlV8yWPR0wflqBk+QDDV8sNSOsTS8wSNFm9facPETKiDqYH8JYG6Zj99k+wYTSsn
         /K6w==
X-Forwarded-Encrypted: i=1; AKwUvBweVnVDVN9JB9vnOX69d/t7TVUUBx7OmKXUYrVGsvzSKGfo59159nVe2Y2mZUhLKKDkE6I=@lists.linux.dev
X-Gm-Message-State: AFuF++l8Enfbekvoh9wXy2kvgkW+DtOMSLuKGvpiEHK/taNzxPexHcdR
	gkYfGTRddeSXJqFc2UNXatPPLLKjV+hNnB3HvNHG/AO0avd9bPzutYbl
X-Gm-Gg: AYBFou3nRTa3XlT0et6u74Sq7aH3ymK1TI8NruUV4A4CLbQyc6rUYmy7f6dotJKdSN2
	qP8OXcPbc8jogSrUFwd7N9E8bnsxn3n+HBv2NQn/MAI9oyhOTA5bJb355guwSTjrBnwA39F53XX
	E5Ze1LJ7S9QMX6xIq5MrNjDlnu51iMK0Ogv5ncO37lJPnI88xQuMf87CtFdN9QE45heNqzmcP8/
	0sNeMGSysdfuuFziNTfRcwJehLWG5knz0uNjHjXuC4ebMYJuDH05UeOcI1owu6CpI0te00tN2Bc
	PknszbKntMRZukdQKgtITDnQMrbHHLZ/ysJsHYmnyRrEdNCet/b2Oelwe14Qy+WoYoSzym5GT/P
	L7tynzzJP7x2xfdD2mTKmzIAZ7EBrXKkA2Tn6GWXyMjcu7QagGZJBzLv2PQJc6EFklq344GO/hv
	Fmk+9eOf2gBvBbBG7hdbpJWJ6FnFYjhphY3l32MSsKLNLrPcsxePTr3P/5ewebPhUWfdy8Z1K/g
	vJpplq5ZqUeJxXkiEoz
X-Received: by 2002:a05:600c:8b08:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a01b00226dmr7192805e9.33.1790752523915;
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/3] mfd: aat2870: Convert to use OF bindings
Date: Wed, 30 Sep 2026 10:15:10 +0300
Message-ID: <20260930071513.54697-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

Svyatoslav Ryhel (3):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 +++++------------
 drivers/regulator/aat2870-regulator.c         |  71 +++++++---
 drivers/video/backlight/aat2870_bl.c          |  54 ++++----
 include/linux/mfd/aat2870.h                   |  95 +------------
 5 files changed, 237 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

