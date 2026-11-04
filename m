Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808581;
	b=2zW16Ri3GSxw0fzm2dnwwbudco15Y1/mnHFYeMCKOs8kvV5peaaY+VCUOIqthjCOqFL7
	 QuTYrkfjs2G7PTi4Bnf2UOAsMbV6aNSVQxyAWKORMGw2CTFawodlD6+AnYuuzc0iHyg9R
	 NOVZZG+O0BRpELZz9LFTuA+wfUNG5fkyLHTdcAC7zd4X54XP3l5hLsp4Y4PtxoDjEkgej
	 3xaO9GO/ak1JsDOY06Um0F2R2+72146pTbhBtwLUuDdGS5uliTvjQh5h8LK7V20S5emH9
	 fiwAgMeImo+eZ9IImmQx2X/9mQSUe8PVZ86qp/qCRZK/VcQdN5glbQCq/OW/Ums/Nsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
	b=XuD+/GkvbycxWhZcA1oC40z+TXuL8PjBlP7vRkj4mYiU1FzzEQ3CMyW49iZ+FmHE9+Fp
	 BiO44+Eu9MmN2xQBYR25rXiJnm1ee3+LgsSFta4Khp0dJRhtQgdMH4ZMGsGKmJjWWpUTr
	 SDsYLWNs0oL2dyklghfCTha6taRbasyca22WBh2Czkf9E6gBx2okH13mvv8nrJTXlTNYi
	 BUWPGL36a819K7H2M49LOUfgNj+zzodHotHBNhUoa0nCC7cQpDxZLpm8aMuXCLzDW1Y+D
	 IxMLkNBuIAbQE2hlnMJIzKx1PdjXNE/j1jryjejlyN/mJrhvxEq1/c1xaBqfX5h7Ylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Kypuxapp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F65606A32D
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 16:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F65606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Kypuxapp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so10570685e9.3
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 08:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808579; x=1794413379; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
        b=Kypuxapp+pxOl3HK8w9kApF/xfeX327wdlVO3oqtPERJi0LRb3KkJVrPJyo6uFO6eA
         qaTJbCLP8vcSqFXyiK9dCcwN5SlgZOgqPe4J2Jr8qUCE3QBXM+jzQbFJtOi+V7QTwtHe
         uEZuiLr5u2S03x/6hkdMzzMtFT1dhXO3LIkT4t6jupy1/2eDluSjsClBQKmib7juQrzh
         n459kHuHhOLLTsz2S2pYFpZmDkx+KcJ15jl6KkIQdoxM0Qq3QTCnrf0xUwP4shicfpmW
         yfACMjpjLz/+50MxyfbNnD6Z/YDegt++1qfO2R2a+mvAML4FlpYPjEeQ4Orqlc5EKb4+
         zlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808579; x=1794413379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1INLi47J6sX/9lLM2V2LXwNIoIOyuzH9kEeqmJr0oEc=;
        b=Wxl74FajFNibqA0JWjVbtXkulUHpIdxbQgvqspsW5sWqxlz9KupmD3mK4do+sJKORA
         D8hbyB3jdUrFpK9kRiP9r5fMui9ip43EwdeS0xPYgggCXk0V+KGRPnWTvStgqxq2ltpz
         o0e2Yt6x6rJN8L3UFBbIbB4YvdDN1LeRFOWP+g7khAYqa955nytA40L6rNeRrqSl6DM8
         m9QJdaqqoT+uz/4IaBSgBw5YH/FYmoTI+jpjgq/HCXECNMlM66Z68pOeZyHrelof0yOY
         2fpcC0uwo+W4MHkF1oqvC6VkAAwmJBFj8X+AoUFfX5FxKupZqrmkVnREalFMN4maNBBE
         jpVA==
X-Gm-Message-State: APuU4Z/Ke/RYDwYjLpntI5C0B1O6V59YuAEGU8GkVihqRjmGE5DKcGnq
	JjpzUUBXyMtBiqaFIECo6ERunbEz/ezJJ/O+6JFekzQI7G4ghUMPiLaPkFoB2KAWmtw=
X-Gm-Gg: AYBFou0k8ReDBn7Xcj+RKnI5IheVFO7WCbaXahQQUr1w9sZhZt0Wfh8sYZxUg9j9xfg
	9mp7w+zNo7SF9evA17/s7CJyCYF5PtPjxNDbobFH0k7k1fTxRhX5t8U/A2YED7wI0BQgEfzTxVT
	IXMLqzvdovfuh1JwKPErsDwr/Ey1gIzeRSbzWE+iBHe7u6+uqZh36f1yo6Ehybg/sxkXPReghoe
	I1r+1VhMnuQudwrbkKq21jSj2KaYwauuUYhF9HcOKI5nkdpXJBsrDhew8sbb7VEYm93OgbmK0xp
	R43tUnj2EbjYBWaDOt1hUWdHhio19zPBWyXMzHO66jyUIzG1rpyA/3nrkgqUoyhpvZy71O4c0Wd
	21IC0kUoRgnc8d0mw+x0PwcwZagSdEB/QxvC95o/84iw01Ia0B/VMHH1mFEvqY4//GFeYRD5l4p
	oWAIehHmz4cXmbPOLCrgD6MkQ1iTycLj8y7Zx2cxmhNuWx1SsS8CfihmwpUf9zzVIo6UKJ7wzp5
	h8bofj97IHxZfOiSVrjuDqy6rsMPCgfZCl4kuK+07bYWNL0kGRXsi+me+q6d2wItN/JKoG65AvA
	NdBWn6+s055njb4QBjMK083KljT+HSMBAVnEDf7a68e20Q==
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr408199185e9.8.1793808579070;
        Wed, 04 Nov 2026 08:09:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/2] mfd: use designated initializers for acpi_device_id
Date: Wed, 04 Nov 2026 16:09:29 +0000
Message-Id: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0JmbUmnJlVceQ/DorQDjMaWtEA0h
 LtbYOHyJe+/v0CiyJTgViwQaebEwWdQpwJsb3xHgl1mUFJplGcpjB1YvFsnjDa2cqj1BRvI+hC
 p5c+eetQHp6l5kh23/Wb0nMYQv/vXjJt3ZFGqf3ZGgcLlL1VVuUzX+9hTF4IbyHcT+9KGcnpBv
 a7rD6JmhzW9AAAA
X-Change-ID: 20261030-acpi-mfd-a6ac9d16671b
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=3284;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=VoE1Fm0xZu0mayKQlGhQQZLIaRumf/QdmutseQMZPwA=;
 b=uybqUEyxjF7iAKy9pKtXAKAQ4dhu98wji8c2TC5h8NLcf/sZMMgMUqqVTNiO6oIJkkWAN26vq
 nWMg9/1QuTnB3bWLAzs8CkPtkkNt8REQo+74FNLy12d6dPmtivfG8A+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v2:
- Split Intel LPSS into its own patch.
- Added a review tag from V1.
- Link to v1: https://patch.msgid.link/20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Zha Qipeng <qipeng.zha@intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-crypto@vger.kernel.org

---
Pawel Zalewski (2):
      mfd: intel-lpss-acpi: Use named initializers for acpi_device_id
      mfd: Use named initializers for acpi_device_id

 drivers/mfd/axp20x-i2c.c              |  2 +-
 drivers/mfd/cs42l43-i2c.c             |  8 ++---
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++++++++------------------
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  4 +--
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  4 +--
 drivers/mfd/intel_soc_pmic_mrfld.c    |  4 +--
 drivers/mfd/kempld-core.c             |  6 ++--
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/upboard-fpga.c            |  6 ++--
 12 files changed, 50 insertions(+), 50 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261030-acpi-mfd-a6ac9d16671b

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

