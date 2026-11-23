Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446165;
	b=kECgAw1cng+rjZ/pw0oMKVC4+GFVKIdkMYY52QqWuPXO8tBxr0ET6OZspOvalr4HZbNR
	 NLQC6pciJVK3ZnIwnl1mC18rLUP7vn1+zWT3/8ujjs7QMxecuxVhcua4EwdP0i/m2uVjb
	 GFPhtHr1muAkK3n/WbwlBvm9AoGPaB9vsL1N6fztrFYffiWgsdZDFlHz4LG++IJLzr9iO
	 29cVeT+c24H7thLrMQp9a1zC5B49m7jYV66SzdZyFkRelz3MwYWLf8g8IKQjBrQOxvBhL
	 gLUjkeo8JV6MUp4r6FZXMvC79LLc7KDCRWMLUZou+hvg7n1x0LzeQJjDivLKuoY+BBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
	b=ki/CJerExm+vrfpnwKjea9mQuDgPkud/wDbIk4LL0KRN5NLABgZ5SAoQlw+89q9upmeQ
	 PIxSrE8J2YR9eIaybNhj0G0sz0EWYpjzKFUjmt4LxkQ+iStRA8+ySHx7YAjd5ZgqS7g5i
	 Xy0H9wsosld6RfeV+FY5cvc4y2x5xwGFYyVcRPR2OzIcj01jrxzosWfECrYwCd7cHpm9V
	 1mwE+uKLeDRGmfTfZby4v3fXhT2MMCuLBZXvMYgifvgvgd1iErHCZisnv7PPmKBKvjyTA
	 bWdO3oycfidbjKTUdcPAI+aP9hc8rwkjPjSscqaDOzrJgskKSBufC05b6Xk9SI6rqyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sD6cCRdc;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F766606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F766606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sD6cCRdc
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c513a854320so560427866b.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446162; x=1796050962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
        b=sD6cCRdc6Pc9VajaAUXj0CceZUHSK3Ym/Ftb41vyxDDZkWi1f8oTXVGxUmwle1OxCR
         V65ZeeSn+LDxHgI1AdNQ383PkmyfqxImvnd35cfx95MeQNFRXdboIzQVJyco5j9rhjgg
         kjDCrqjItNqV8TKAIlW2hRdH+cSXGFN9608FwOgYaWR6kDImBjY3AvM82uqRrpLff/y1
         YkO3U+AcQPst4uG/VxfeB0UrBNZSKhvnzpBNywFfSsMFwKWCnh2/RqMTWvkOcJ1QJ5Lz
         zYLoeIcKBLL2R0b9O85fJQDlXRQVTEurGIA3A23ahJftJRv+WAn+eAxbQHAX/RiwZwsE
         L3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446162; x=1796050962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
        b=N6WxhTL4u0bTS3DdbGHsW0MHOTySZpJpytrB3wkRZACh5C/NU3n6WzJvXkGgqFI1hr
         lFo9egwaK1nIrzP9JxnoJyyErwZkNXvy+zI0C0hX40rPXOhkqlqIpWpdnn656qYmmmdx
         ya4TVQLY21YhZ4+Am7VkDROgAejOjCCl6DT3eLE/Oax7mtPJWKR7x8/i4Z/eh1nNDhZ7
         DHJwGWkI47e+5E+P2oduZb9WlxcgPoyokM48BxhA2RxZZnMWILaOT8B/kucy8iF9OEdh
         E6FmW4sIbNWqgk4AY+gj+xWoD05AKTeskl69pBcRg1yrDCloHUvmp4SwIpe79+wtg7K/
         Xykw==
X-Forwarded-Encrypted: i=1; AL+hErEIcXFhj+X77i2tzZ7RW03LHqekOHazKAilB1MeDJSiaz146JS8OXwLAClzoyu9gFlwjnY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/0dcoZ3Q0xCj6N2XmjrqWB4eHt2ULR0Gpm5OoQOYOyUhdNDvo9
	/0gI26IoJI71EqNqwtPhWAEZcFdllGnvePmx2lsyF3dJAxbi7kryfoNV
X-Gm-Gg: AZFdTZc9eJ+B+WEm0C1NK+U6KqCGoqGKP5gk1ihi3WtByYRO6CudVDFUPhW6YPgyuyr
	LRzrPPWxQ5Vs+aVdScoWANoUIlcgcRLheHjcbR5BtOoRgg2AdzgyGoi2wbv/5zSBqh7OvRirCka
	QTiXOOunddwrAGxXw5ACC5hU0Hu2UDyIR1DeuwnLSVrnTMuqCvUSmZ5d2ZCZ/sFhpA4n6AFYfnU
	W6oLppVP0zaYg0zWB/x/cqy4YIAYvx6VbX5KbPFKSmGqj6nfKYu74XHaptQz95suY6AMr9Ba/N2
	2dAoOg8UmrlzSAuCWIdTfINqydZFQJiCVgZP9QloaS5GsBhUI90geTu452rq5inJWV4giGYOjJG
	9yqa8/4C7wSjPvB1zEtNgEoQK5TcGf+L/PLDwKkRMKR0K51k8Ccjqn1SEVdOLTKK6tBJcgEk5vi
	zYc5wGROOONf4ZLGpnEWnmX9imXeF61Z5ovEn2NS6mdoxJA8xikogneq51y47JuZuejQIxraQir
	GUPTWu+x7/hrzicDK9QoleK8DzHkQLhvJjkgA0Drg/BUK+heMte5oPvRocctZqQ2Zunyez6RTF3
	0gmv1Y0gtcd6SJa/pi66zNlMWx6uc4kQkMCBVli572JhNjUwNaVUZGUziYyTw3MIJVHq1ytRzSG
	iAlM+XYKgFQ==
X-Received: by 2002:a17:907:f447:b0:c51:3b74:9d07 with SMTP id a640c23a62f3a-c513b74a25fmr971881966b.18.1795446162362;
        Mon, 23 Nov 2026 07:02:42 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 0/5] mfd: max8907: Schema, pdata and poweroff
Date: Mon, 23 Nov 2026 17:02:19 +0200
Message-ID: <20261123150224.199601-1-clamor95@gmail.com>
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

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.
Add restsrt handler.

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()

Changes in v4:
- dropped in-supply type definitions in schema

Changes in v5:
- rebased to be applicable on top of devm_kzalloc_obj conversion
- added restart handler

Changes in v6:
- rebased on top of latest next
- resolved conflict with Lee commit
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 168 ++++-------
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   6 +-
 5 files changed, 349 insertions(+), 185 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

