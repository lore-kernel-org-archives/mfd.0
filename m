Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150854;
	b=LpOR/eryAsb2NMSDY5Ou6jFKJtGzzomgTIPPoe9lZh0VmpnBkeFHK2ea+netztYKst8s
	 ZWTpSHlnadYLPwQxDJyOug8g/rde/LXjFcxurrE0NP+OBSE423BMusQAqXzspr0LBjaoA
	 c2XfHZG+yknSrTRM962ZczdjBsgFB9q11g5rhnVrvvOd2KYOXCcCC8+Wyqw71Y5cbx6DQ
	 bNzPzGjy7haVQkxyh+A4bHEDYuLQps6YLAnYAuzJ+Xyg9MV0rCR0KYn4zE9QSkYFvOKq8
	 m/x/VOPzzrLksXBuxhmcRM3aV28eLS2h8Lz5Il3uwL9DwbM+RbrpUKc433ld0+qb5Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
	b=USeKUrTa1mHgZOqqirwiSyiICIDmd7zd4T85C3xfTIrAZBORz7ouI/C5h2NBbadoh1PN
	 pVOPszwhOdq/Epv3LTYiJo9n8dnjvoFOyOQ1g/3FVfURqL8DCRGL66Rf+26KOfEkRHvZq
	 ZMMVDpu2XVsle9ED/VpMF8ovavoScHc7WPnJYowTYGJmR7Jl11cUAQxcbG98Hr76sTAVI
	 sQgh5kbTQZrkBnH9AxlNFhWYgl8SI6oKE9PGZEumUeb4PQifCpA2R3ExpyfHy9DttCcK5
	 3eRpfUBr2cwJa1mlRPYyTWkK4gbfTprXZ11bzvW64uBEg/6iUsjnyF4C/K/V9dSviOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7GtYfqj;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE93606A31C
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7GtYfqj
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d581da0aaso12086366b.2
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=t7GtYfqjyu3HJMjC7aYONxGwcFmrBQWiFzDlJ01k7x9xn47FHId9jWSzzl5nlewUep
         ww9L+FK/9vVnrewcC9OCLcAaV2JF6oEXD2EKpN9RCbyRlg7e6V2VB5ppbBGYwaZu7A3Q
         DQlbUF9BXm51YxRa2rnEulnD8R8hWFE770aG/qxteeuo5+l2UKGTPSLR3QOsXEJxlxig
         CviF3OFVpNnsiFo/hlA955DQmGV/xCb0dlYe45NrC/5f9EDn6Nzv1ExmVB3dFlYtt0TJ
         mAd+loNfAjKV00ReKbE1BfqeV6GpDa8CCmyPseRrQcm2q//41ryzgQJdjAaUHPKE2Eqr
         jAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=vmB8Pm1LH3z31SgK2ghAJMhhn79TYLEscB996cNjlIAtn55vuVJwg2Agax1QKqnP2d
         PDNr1AOwg3qaKZKtwTqLJDO8fMMkFo8WsEzf5FXudwv6qeBMXhBvIICYWGE6k+XvY2jp
         Tui+bTvow00jwfvC6UBESdupaHdnsY/GYrBeFw9l54meuSowSzjfajW/oMSp9HO2Wt8k
         /v5YrXbjnJJ66ufqKxtNvP+uRzDBxHFgEKhTJErSdhFFnzpZeJkwT7rMDlWCIjHt7LK0
         XaRCgR3Qxn3oJG0huPC4SfBAWh+uU0Zkwsv9VcicTEtPNEJ9rQ5oPHrfIAbTk+nr6R3T
         34Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwpc8wxvEeqfx2hyZPsPyn+JLB2vdv3EmoTcSLwp3ywbTkYpgS9e0r6ex4ColdXtsQwODQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Gr12u4QFDKHLuXZtjW6KaQeAfaiKnESfClLsbFiYwIvvJf+Xe
	YXkpN70ZBBJjZP/MP7xX10noN0+nlu7M+AqMwNJ911uliHrGyCrpSRCg
X-Gm-Gg: AYBFou0D4I5MlS0nfDQ8T4Z7CN6RV5dj3EM/69cPmdndkhurDUS+d1FHkTTM4C7XUQk
	a0GYZFnnxUVkLuWuVjWKotm5SkWxR4UjF3d4pCtCDdVanABqwppIwACjXJ1d16sWjGRKSXm4X98
	GOg0BlDrylK5nj9trh5iLgbLuVT4jZqVChwIET302jYn5PnAkpI2cm58gvtTLACxrjSPzqgIar0
	UBtmgiM8Q5yP/n/ElDPdzSBaksBJMUY0qtnqcXKpB3ujcLliDHvVsAVDeRjNi1a6QWHfusp0RYc
	3k8onCadUF+Jkh3/f27p4Tm3Zs8vepfN+sbDAu+j/oSYhImEhWA3LgkbfkpFRGEDAbhjprYRoIE
	dKVr/Yn9b0jNnR/nF0acZCJyWrkKjNO96RI1wUQS72cIFOzon4QBZRUVpO9UAHZPB2kOezQzonw
	xwqB9CEetstw2SGCL1h45/IahVfn0xJatTDVQSV14BRJ9owwZlybxeh8PrVflAVUG5r3sIBLVYR
	ylhVx7PN3YGET6zMqGFwn9AgLecqBEwQugyaavlhfHw3ikJcvjrHFDqXQuqbcbC3cciBKd6ZaI9
	VIS1q+YIdmn5rgtQBcBdhwpCuxGkrpw0XCYe9KiHLfddIckmahKb4hnhHz3KT+pGqwWrwVXOqfi
	H+jsjv6Nrng==
X-Received: by 2002:a17:906:c150:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c4d6db81459mr108618266b.35.1794150850606;
        Sun, 08 Nov 2026 07:14:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:45 +0200
Message-ID: <20261108151348.204182-1-clamor95@gmail.com>
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

