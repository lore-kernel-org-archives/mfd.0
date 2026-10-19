Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6DD4C225E
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404584; cv=none; b=XAeT0AdHViACRf2W9K3GZ35u7XFE1zRCXPBxXU3czfWfKc2V7aXmVYqF8Pv2BuiRYaJ5+/WB1M5lGq4/ndgtPwVvrLSaP/BVJIKLihpO7nes32xqTUKoxZAKhoSfqpSpCn0K3xczQmW4LVJ0tHwLpak+OtYgQpKbnDy4Wd8uIew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404584; c=relaxed/simple;
	bh=gdG7DaAftWT3ADCplqkxnyzdbLARSb0KMGw7e2oKzQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6G3ywmPdLdamxMSKVf2ap9m38aeblaclof+fovJ5s1HCSi58otE6GZSQ4deW7tw8HpfbyyMKDgtVisM+oC0RNInA3mD9cKzL1hWT45QZTYXi6uXw+E+RM4Gdt+mStgps//7QjAqb1HTRKtxvb0hW5EMxoibu1otFee4soPqvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXJ1MSie; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXJ1MSie"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c45111bebso1146191f8f.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404581; x=1793009381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2k1+XdFZpFLCHbc15Fx/KjwLwLdvrI4ZxyGFOBKUCSU=;
        b=mXJ1MSie4Vo65KoWaGv6CTXw/T99Xe2WaTGMyTRhqUMwKNnsAN6V3tNBe83WziwO/I
         CExQyn0pfV4a60eHykOPKXtJKi+PVzT0K8rsGYQzl62/0ZH32zejbqQnrWEbGI0tqDWr
         rb5SZ9v1GJq5VNeEnVzHWuHCWPSZrog8q/YDvoUE0YTGRUc/Pc/ax3XJg2kCWEfT1AZx
         YQFBjdHmXgnXz+DL89TP/UTNk346/qBdZiN3k5o5fsimscjbXraO/HR79AmAn3tOO/KX
         iDtVyZpIE9ZPQopPIodnPybtulgdx7fb9X/yDns4YV2FmCva7Iz1Fsi0qoEq+DArSaVY
         PA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404581; x=1793009381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2k1+XdFZpFLCHbc15Fx/KjwLwLdvrI4ZxyGFOBKUCSU=;
        b=nQasFdNj9E8vn8zgMnC2ik/6l8987V/wlpW0JYgjfCM3LKjOEtT6eNyM8emLeDL1Od
         A3w0Rcr0I3KnLXbDODpgZUeAXxWBg1ZX1sg8Evzg35Us3PcyTeTijMcD4QRAMaMLn7Qn
         Mzl1S3g5SG0qRSxuCYz2C68pXS5trmT1rtxqvorz4Lz6BpROvLDlKagDEFgqnJd5GT+W
         jlU4bp988Mqv+sdpRIb32lph7AD9r/SYSYiZNDXdMc7G0U/qyFODBBEeJPxpQSejeQ1x
         Z8F6ZwsNrgbB1SaFlJEHGzUWGJP566fqeOfC1+tGHa3pPUNPDdxjI3ZZ8hwsm2arkfSF
         2JBg==
X-Forwarded-Encrypted: i=1; AKwUvBz4M6Q2UipWTQQf+yg1uEiLYr60OpZAmCfNInZRVEpTUn389YCgjfvLBYozxhHz3VXtTP4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJnoDKUr6Yh2izAcfratiTrxfF39Vd6+S0nzYPf+4Cg+kOrA3J8
	fIaCtn5hKkg8IlZccnlsfOuDCfut9OuTimhGkkSTE0a4/46YluQNKmTL
X-Gm-Gg: AYBFou0H8wvxIFUdlc0T7BJxB8hBkr7mio9xHm7h9k9uLxfdbQeNfXIBElSpLdJl9V2
	s6O9KpwHmcKx8C0HPDvBnNyrJ6hrSzt+ZivH7dgn+LU96pre3ScEJFEj1EyP4pal0trpFU5Rl+L
	q+MYH9/n8kT8R//Mg7WCKBi1ryleDrYCHPLOT5c5rGyqgkHZ9wKDIPrGde2pP1AEsAHaUz8IjUn
	UQ2T8OmzSENRIb1xkNgjDMnVMuaaGHI/ofOzvSfysA8FaEUxwl3ZQPNSDN6B4vJlsiCzI201ZUh
	u02lthnjv6/2HXNjJpUhjsDBjtCHFFqSaTsh6acxQN01Ji+ZPUmPiwAT2H+9GtigC4PLW1cbQLD
	Yog41MAJ8G4I1QyrTJn6BWYtaYR4x/7nPHRQbhzPJW3530xEFa5rOahILXD6zgEcC5Z9PKP6wNA
	a9BBrU38X+QqxWh5YE+DUlUeOFIbuwdefSUz+3pgvKBRpIEAPbUR7g12weMZJjPM6FQeD027xJb
	bxRS1nAghaR5Dy/VM8=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a1d7616464mr162248185e9.27.1792404580998;
        Mon, 19 Oct 2026 03:09:40 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:40 -0700 (PDT)
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
Subject: [PATCH v4 0/4] mfd: aat2870: Convert to use OF bindings
Date: Mon, 19 Oct 2026 13:09:26 +0300
Message-ID: <20261019100930.110954-1-clamor95@gmail.com>
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

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32
---

Svyatoslav Ryhel (4):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 ++++---------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  79 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 260 insertions(+), 318 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

