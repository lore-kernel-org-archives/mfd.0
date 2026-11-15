Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733119;
	b=Cu+AAP0e2+bMO1+zK9QvRpTwuMXGVgDP3qJJHpMJc1Pt7/wO1bo2jd4ECBLxDDj9wEvE
	 MwnmTJsWJE9dqyY0FmIOJ3sCFlW6YdojQnUk8gx1tI2o5qPi+99qnXPzhSm6xTMDkW+D5
	 clxJAAYvyKbRYp856Rwd0bEBPIhshIBoDHyiKh9ncncvbm9i2RuJ/MpISMX4vLATUuoBy
	 N2tkXZLkQjkidnpsZg3W1bplLv6vi71AAUZmrQYpZbJ2bAzN+iwCRXSYWF2K3lpDztA+/
	 vI4rYRLmDY4BDMrUeyuYDlr2rvARtrq+eFQiompFjKzGUm/cFVHe3u5IuJ11ncJ6OQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
	b=xY+B6cpyabRNIBI2AH4qRFGIyD/abv/9cERWXMfF53t66+QYiOX/vTII7CWdJ40CnJhV
	 yad53rtaQJbOUI82WZsIgKoNKVux1FnIppfkG6ZbKHUws3aN00jX3EssOrvZmMYpvjXSO
	 TYBeZ9IBzJzOxjD6vCMsxu378AiIdKzTydb6BJHBK9R+lGrhE5+dtMUkqGmAuIAtTaS3R
	 CC3/VbmwN7ZWuE14WlzOg2qqeRL/KNL792JzwKHtohOIXsTOvJcPLuRxiMLbahAd99FQm
	 s5lHDkbyeHeBywwL38Etv36zGO2mmbuqEIZpHXuwgc/D6BqgXjQzxGqS/Ib8xt0pnCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E6TT2/mz";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AE606A31A
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 08:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6TT2/mz
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d581da0aaso307655366b.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733117; x=1795337917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=E6TT2/mzwFr9BLrDf7PgQb8qZSstkExZtPHfph39lqTmXtZjbSWxdarlrhVRUJ2idu
         7UG/pfltuuv4+hrCvmnvSifBrNrgWigVYIaAaoYspY/VQ13V3AoAwYLWMd//1YTjn9lR
         U9nuwg4JStcqTzgTvlDzCqocqQtZgHjYPz1ffxZBiZ7sjm0GR4NKxjNwiK0JTm/hCG2L
         GGkL7+7Q22DDQjqFaJLe9A2VKeXaXYe/ZD7+i/dterYUZRaoRrvHI4ol42PQ++b+84xm
         Zqu3WJLDO63t7MvlHOf9f7l82JIrfFyri0ylhYpJWA8nqd1dQAHXWARp/+h9gOXUc8EH
         npDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733117; x=1795337917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=O4zwLzRrcAQmPDTZWy35GJTFWS4j9yGEV1k5WYyIgnlrFRO878qqyg1/yNk4Vu8xqw
         BECepqamTWPHcwTcnnhPeMo6xIM0NAQAgQtGcyGT5oDewcBtx+uaPz+bU4nzsK9E0x6H
         WM/h9HKumiFKOO1aKyxQAXXKIdSiaBoBQu68TiQyyu0omEMuqwOT3kJeOnRqMvNuKyq8
         ABQ9CkB4+tfGv1phP8bGvD3Cg3XoAIbGwgsdeuIEW6qL7zidrA7o3ZjJIRwvUqnZVUfR
         t1ot2skUCS0SpmVd3+MA8Ww/EGl6TAvv7kbQzNCbbKqN5XcLcCUSAokmFRd9W3RN9rid
         UEBA==
X-Forwarded-Encrypted: i=1; AL+hErFMJgAP/oGBXnQWKEmDVf4g9QTdTcCQgXhi7SCiHmJCdGJK2TJq0KN7TKHn9YFKsgbs3pI=@lists.linux.dev
X-Gm-Message-State: APuU4Z91193atWMYnuOa9o1DAYE6nD+oW6mryUn2tVeWuVJdHrE9mzKY
	9a0ux7CDQ58oN1pxfmfQVN4L2gMVHLwgAoA9JAu4iIsvc1ZOJugAHnrX
X-Gm-Gg: AYBFou0lpRfP4v2ttqbQI2VBqsYd01VMJcdxbDPpE+BEW9R17cGxvWxqyWGlBtaa1jK
	puIN57rVgxFhUnOvAMoIVb1va/N8Ff35ULK5gJczMcN+6636UosBtwP0xRdTWAbDxztVnp4CVCW
	zlpV6HgstjFjTJD8msI5lOqyb/hv7flfmxPfasNmDzk4O1ODm8IN1ulji2CQ8h+CbaRl39qOR+w
	eL+CbFbmiyoZYVq0cd+ybvJYN63t/xJC9SG04JgyjpvgG/wp4iHBs/ApYgY+p9kwW2w0rfu+f1J
	FRkUCF2VSvNh11ZMDn09W2GwHxxXetB3VHSThlFV4dS0YZnMRSV9QCArGWp8f1wVw0eiCEzTUzN
	EwRsuleiPxnpP9KDfu9Lc+/i8ryf1L1tDyTzxgwC83vCl9t4ralBBzeRCrWCkAfCvZ+h2LHZQeM
	Z1XKTD06tDS4kUcfKOn/IytZC6UXr2HUu9p9i6qIbU5YC66T4OJPPwWChRCu10ajbdWbwUVBGTw
	+m8ep44xBEA3aQALPfsxzSWHTrOywNjYutgvEMhW7kp9rzVv9F91ttgBN8WSFKIaG2vXAVjqhTR
	h0hfsjbMEB960TmqBfzeCCkkJFpCGw78UHrmlosHo+K/HecaTi7LGLzE8bnJxeTY8pdXFtNm8Lx
	wB/1UrGfbOg==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr585009166b.22.1794733116617;
        Sun, 15 Nov 2026 00:58:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 0/4] mfd: aat2870: Convert to use OF bindings
Date: Sun, 15 Nov 2026 10:58:21 +0200
Message-ID: <20261115085826.89641-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
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

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion

Changes in v7:
- rebased to be applicable on top of devm_kzalloc_obj conversion
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

