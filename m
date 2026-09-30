Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767F44E676
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753270; cv=none; b=ndkX/FjN0mVtlkyugOU9sJtcQrvcTjYgRRRTgL7Ib6fBqn7roYGjjbO7jQ56J8Jw0BTgUceejGvrNtedaFbfZ+nuscW9OS1Agi2VmT8RWb9lb4O+sIwk5HI3cIAACxQawfkeW2yepuGwdDlSClx7sOUBGuoguI2f/QtYdFdaBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753270; c=relaxed/simple;
	bh=tUpEzOCfmUF6KJldh55ia/zdgVa3346cD2y6uHf2ak8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbnVNTGrY5o5hb8zmsaINxA6Ruq6G2nKePqLpovsav8+9EC6HPIH8owgzyw5y22kigQrQrfKUVshsi5GNgvMzXYcV68/fZqaGVpAsVh66FYGu/KDbcTyCsdt0jHUNiAmilBNlAOzRlvxTkPX8xLL8CDS98bFcD7ctFQfIhQkzxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrgcfpSi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrgcfpSi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso52302095e9.1
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753266; x=1791358066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=IrgcfpSiufA11FiiGpwMYte+N8qowxIYly201Z0JqaWF7gDt14EgsTi/9gL2K5mAih
         0BwSY3ENCbLIiBmCKVXOAubyytRJmprRwDZrih+hcskLOITNp6CzXsEtS0MILQfvejha
         Qg0gjf7eL6xpCeYFZ/SVw+1cx7Kte+sD873Gr5FkOnAtmIC6WzTB058o1YxS7EfUdVUY
         vOPTmWQbig+YvHdp0JCqlMJh2U8mILHg8iLJNwAutKHs86ulgTRZ1OCWzKk3cqgyhh8g
         LWl9TGUvrVqs4ig2Uo2etcpaBozsNWJZLvVZ4LFB0tXQKlef7X8HIAsfNjKrafFZ2rS8
         6wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753266; x=1791358066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=jH1/byw6XIfgeEYii1c9nu7fIVSOwoPVJneLWfZpSNrJfGYUI2aZtGzZmb0iVlMJIV
         4HaidxIRumitSRBMiUbrPwvm2jYuJqJ0i+PD3hrr89ujHIeO1FtkgkTn18FPaMSNN9tz
         LPlQ+eGJVVTnUOKvKgzc3ZYcDwk4VjjoOkpHKuPl2VRcYFrXO0Zh9yfH8yoiNwQYefaC
         Sub6TYS4tKGA+0KYu6GaDFxtMUcysOjsv7nGGMwR4aM6TCqLtCLoMEqorQ2PoIOoFQG4
         SmtlQXGuF99xhHJQGvcCJ4yI1lj8S2MfQIXJ8EcN9QnYT6lWT69a6gIno4wveYCEbECP
         zi1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4Us8bcO3R3DvgAqQ46t66PkjNV8TvfaYCTGREe1w/hacSGKK7NY2s7XwEnP8S3JZeD4E=@lists.linux.dev
X-Gm-Message-State: AFuF++m1QuHkZ5f0ZUxefPYe/3B5ZuaOGFpJMWRv6Ry7qVvLPxGpRg6c
	PvcmXguCC/cbq8Fx6TNgHiq9dNme2YCZ3lVJHUjjMiOH0nEBsxeI/IC7
X-Gm-Gg: AYBFou1HTzNZUjr167n6LmQtV90i8Nz4dnLObqgnkbALNALc4IzHaQaFz+TVkUnWLr4
	yzDLZQfbjLfhTiwjvPqvosP6+s1+RlYASsZWvLrUoN+gSxTwbnVw4jz/4XPm7pa2BTEezcVn3Ai
	h8wvD35A/wOOXDjCKJ5RuYt4hGY4JHXgj1nZzqmIsOQJIuiD95cvovYl+IjTY0NVg7PBv2u0iUZ
	UcO0bFUht2SqVxBJAOV3f4DBMxtolYuzh7I1NGWUDT5Rm8Q3aq19mXvSBtwlaXIioyw/IepA5pK
	0GPlP643D9x1m9jKrxwsZIzpXBzS9alFX72sUNUxkMGFcr13yJ4MlKHRHTiwwfIDHdZjjyS4QSz
	6pG0/QLgqgzvRxrpa3HWFUQ9eMx3SpR89C6/xeWNGGmN7YKI/dFMBRtEAfEtnoYel/+umA7iVBI
	pma+/jjCoS7e/GQ+4MAifNU5XRa1WzWif/7Wch5qT1PaIAU3roQQcU1IPjooduDj3970fCsYQF0
	8+wQ3xeeekeeWoXr4U=
X-Received: by 2002:a05:600c:8b88:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a01adde996mr6121365e9.9.1790753266400;
        Wed, 30 Sep 2026 00:27:46 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a84419sm27680985e9.1.2026.09.30.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:27:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/1] leds: Add driver for MAX8907 LED cell
Date: Wed, 30 Sep 2026 10:27:31 +0300
Message-ID: <20260930072732.66578-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Svyatoslav Ryhel (1):
  leds: Add driver for MAX8907 LED cell

 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

