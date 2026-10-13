Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC2952ED28
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914988; cv=none; b=dHVO8v+ZCd0fr0U0cvakI7ruco1j91xxFD6rgAaSMjz9ZvvHpN2pPZ3+oj/OqGMEirBmkb+5XHHhfKe0eBtl6/fdNq4MBACGGKKTLRPmOwJssmkPj70HEOFmVkzIh83wx/djiSubGhlwYoIfQXqyf+LM6UQNJIpebb6QMwpcq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914988; c=relaxed/simple;
	bh=N4LcWhqablCQy7AuG+dp47sWdEyawhDBW56fssZm3h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZr/ICuSdFcjn3y+ZAwrkaeybhOtVOrgCzwwzzGo5GL+hiAcgXY0ZzysjN9lkNUSbgQp9JGBb8xYIZ+c37H3W9f0Knri8+Hw9+T94AghMnnCfpkpvTH2LICydSidXeuvuwUjzBUMcalg1mEm9jkJSHVZ3hVyoD+WLAZnOL08P7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7IH8H+B; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7IH8H+B"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1905471f8f.3
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914985; x=1792519785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ni5fu/M2p02kW2mgvbfBzY77o7xL0dnmXboaLsv73E=;
        b=W7IH8H+B7y0gLs+v6/RP/3vtiFQC4MPRD9Jlz+xz2o/KtL5mJ1KarBwfpQJ98BNLMN
         0NRopFSIuEkPrTyr4HYjxzAOkkr/pHy0TlIaA+Y/gHersYgETtS5UHGa+viIA7QIkikC
         BQUjQ721OOh7gfFbalTSttghBRKbNJ81owEv672xe4+TUQ1UBxplg7eKyUAofhtLSxUG
         BvA2MyiXC/fFqy/lg6iR2uzlpQJtdxKAPYyGDKol5TUjr/Qe03uf2CiNS+xlJ1h/Tior
         xGe3n00gSk8ibLWSv5F+L49R1YYADz09FQkTuniJ4M9FuwkJyC2Gn2zZxaWfsZfGoawi
         9aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914985; x=1792519785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ni5fu/M2p02kW2mgvbfBzY77o7xL0dnmXboaLsv73E=;
        b=caD1HcFdSspPR+w5ajV4GK5J9wUajPnfFb+5jmvaQslqfL6SeXFSCWguqu+VywiGGQ
         F8dmuiV32dIBXo9V/XlF/HFBR59qUa0FxMWFoaEcGJTBgm3/ofM0g0i1aqdpSIyXvGQZ
         0kMyooR3QI6OLSIbs0j4fqW9gzSJMPUwEyD9j5Fux5EccwXu5p/dKETZilqL04jXqWPh
         sf5bi7IZaFSBmArNkoIaRqliVr/wPHJMJ7n1K3vr50DbRj2WBvzrfTQWXJT91DpJb2ed
         lnvsr+K4I7/bIjq0TGNU36T/QEgPwjC3GsyTefBOjhM3AWF1ClAUcxJA74OUnx7WlFmx
         9/SQ==
X-Forwarded-Encrypted: i=1; AKwUvByiNwlpdX4taVQty6/fAkLfDCOIdTeOmYNjTbhm8L2EyfW0TkFOQzPZxu9jAveC7+X7uug=@lists.linux.dev
X-Gm-Message-State: AFq9FYLtuN7Vq9HPwXzupx36aOHVAZba0QGhhcvUWGft7P3G3kDe7H0X
	cb+AjuOr1akGPqPPM7IhlcT+2qb3fuxYw+gLWYZfUlTCsesGLPZFf1X8
X-Gm-Gg: AYBFou16qF15B/fYiUWAU++D2xS5ScuDWiCiH+IMHAbpqM3dFFql8+0V7Antjbxs04w
	RO3J5WEtwykacoFdUlW28WKuTwCzVWujEFgA2uOwHdCLVVsxaOIhK8O1jjwKQDsBcdp9pgQeKL6
	s0dQnMs6zH/ONxAKBMWyqWKsVaaXjKrc4siXqLdrNq8pEX20HHxo7AgswPvH/gzKoHsBX3RB4TB
	Df+bcthh8vBJUTbN2VuRulhzpsOHcA6Mfyv8Hvq4r/ZnRfl6EsmW0anIPl3iWnpeJvEeaN6I7fg
	9QbtU50MFGGJVBQ3xkx8UVdJ8Bi1qM4Ty4U1NrIn2mkEJM/jWPHUuMnzIQeXtVD54VD8oM8M/G7
	hAxOxKL+Q8q/uKJYxSvAGncmofDCu8QFRc6PueE+3U8MF5S/rlovfbGbgGqD/0pxnxiuO7qzoGX
	r74dEH1Y56KROL3jtZBnRNHGyLiJxp83Z1vqQYn3MM1uXKU/yXzQD2rXv5rGIEsHQAbKU+urHCk
	gJS36xDP0OdQX9pmF7gZuNei+rwug==
X-Received: by 2002:a5d:5545:0:b0:487:27f6:a4e5 with SMTP id ffacd0b85a97d-48dbad4b6d5mr19310156f8f.53.1791914985161;
        Tue, 13 Oct 2026 11:09:45 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:44 -0700 (PDT)
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
Subject: [PATCH v3 0/4] mfd: aat2870: Convert to use OF bindings
Date: Tue, 13 Oct 2026 21:09:29 +0300
Message-ID: <20261013180933.487013-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (4):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 ++++---------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  77 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 259 insertions(+), 317 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

