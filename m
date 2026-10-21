Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582476;
	b=p84r764kMO+1zoCaHxburaNGB0U7bbHbJQ4s9XE9qW5wG3Xy+PWBdu2fn66e7XtmjRLY
	 nsKRlGDkG7eVzgnl7TBTqvKoa2JHJ+AJ0iJTCWse9+dToBzEJVgXPImh7LoYy+mNggHaq
	 dGBpuLqTXvgTwBHbwnIwrBDUCHwoY5wLmWA3zZ9zYmKoWQvDQdSTIdkX+Z6Gu2VaRHSrT
	 PVbYyMZEH/4LFH+LVwtzVi86zgku6rXZT8z2KJ77lr07uWcKIGuhPRB2bIen1RdOUqLGJ
	 hV46WRXgcukbQNXBxKpINndIZZfhgz+nvRl5vF13pIBTxypN9V4owpTgJ9lVcRzsxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
	b=W4T/RWndvdQf2t7e/o+Ljx9ywOrF+Hd89EcDUf9SZh5piiph9i1uEIYs7HYeS9juz8xo
	 ngQDqYta8T1O3ykUAACt64h2exgSj6oRCVhOLZqB0Fwu4YDOq0O+QW9zvbQi7WhctKeZr
	 pP1kqYmEOgl2DRJljmu+wztFi+zfd4xRW7Uqx3jJYEbZDTKxnGHsElhEdI5Vwfti9W3Y6
	 w9MbI01D1Jz2cP8Sl2Gpwujs3x8X70rziGqNe38ksLvyNBRo8KDj+WuGrz59h1QgtWdg0
	 HyZezc42iNX/BfBPNSXSf7DBHgPVgajZqqyepQKWS41P4KjYrEJ4FiO+zCLe4SP9muQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TV5q1BYI;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9C606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 11:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TV5q1BYI
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1181592f8f.1
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582474; x=1793187274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
        b=TV5q1BYIEeSQb0EQBn1zhBRHAIfPVsb3EMPkPna/DyFRzG2K8ICxlE7nghkWxM6EZW
         +AVS0RYX0NMeFJ0SOqCKPRBH/aEP886GsFq4y+viOeAdanHVtLyNUQsPEIVgCwcPHwPF
         LFHIInbU2qxUMLisuIyiHuAT+EXzzTGDlK+o6Zec7ACYA3+lYLKCZBrh2ednl/3NZ7HK
         wtnugTR6mDStMubH0cDXiMcUSex4vW2Zj/YCejzE7m8IPy14GXBudn+lh5xd4wmY3h/D
         8Og/WW03j/MAsaVAG8kuZxUhEZZy8VMD30bo9za14BYA0PebLCoEMgwWNRSqYuzqmw5l
         xGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582474; x=1793187274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
        b=lVFKaeNiB8V4r3OwZrjYfi6YuE3eZAOp14x2Shv71PYMk4xnNpqclgJMhHHDyn32yP
         72TsNRKDPAy9yhQ3X3SnNrslm3mb+OUGgqih2r1PP3tJKvqDVdPuS2jV1hdtjPR0QOG5
         zOqBMz3KXqHMq6+dfSDtCwHj3W6l/kM7KuPjIiEQyg2Ek0Cf0yQfCEgwLA7he3iM2Odl
         kAjW3kNr/JwxGdg8WvTnaFUyfXyIX5cw+8TbOl0eS6LL2HEpLMkIXAqBY7MoXTa4Ja8R
         wAqyvnTVMw8FIOFgtFyonWvucBGcxB02UiYB5A7EJ9lVzD6WwisA/cIa2B9tx53QViv0
         6tYg==
X-Forwarded-Encrypted: i=1; AKwUvBx/GJAwu8NRr0fLuQeHWqOrE1jZMyUo2rRDho36CgC7Yvdd29IgCoCwqEFaWLVYPu20GiU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIrQ/UvZ5+Ko44vRxD6gtDci0n/OpR/mSPwCad/x5kt5SLsHvus
	l63AgaBlRYCOyO4ShMT9TGcl0pL7mbhnRKaR9vH0gTX+dLXyPY01O6CBUy9xJQ==
X-Gm-Gg: AYBFou2aISMiE4p6DVpC/VxXuVQ3+rIzh1YEjwcpTqSF6/zLzk34PU0c4sJZ3qEfrtD
	5z1juW+Mi+6iWSEIvs/QkIPfywOqdGTBwfksnUlz7z1PWNjSW33W+wvKNehNsIZTzQ92KEhXmI7
	dYOIlYsqyQT0Hw8rvulw5B7qbWXWmz5K2yP1BFifDPA3I59JQws8hZJIo2gpJsF+a1upv/v11NM
	1Hu6X+84GxVs5zqmejnF8os1bjF1L4OJr8gQnUI7zMx7gtiYdtgigvLzY0/k8Sj1ng3W/RXokFG
	z5zphK8Y5h3J5xVHMxZRY7tEwNFzwFwDZ/qukbJfyEpgxdR/PY7Xhols9U/0MwiCX30NSMfsXMe
	rGposMjKoSD/aPprqb5nyGh5P8sOS5nXBPmcjkNU0oeSlHbJW9rWYhck/PWthAoueXJL3aMLajP
	fKC8wSawnWnz9u7hvndw7/vy+VqXp8tIVZuuM+ngWjGC/KrivUd1a2UfhJKUAfQHDUUIRw+ljly
	4/SkeyP+N2umapmNkJLsed2YuVhakNZsF1vYmm/1kKpiWABSmDbOxXsP6retdpCMUpNIS2TLpf5
	wZ8qiwwzCtvJJcRXuZPw8XlszuCQw7oYnLxFItVn4ydADXmWFXOYGkHNmsMq
X-Received: by 2002:a05:6000:4553:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48e264ce5dcmr2487077f8f.19.1792582473710;
        Wed, 21 Oct 2026 04:34:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm5068768f8f.33.2026.10.21.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:34:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/2] mfd: add Airoha AN8855 switch support
Date: Wed, 21 Oct 2026 13:34:15 +0200
Message-ID: <20261021113419.283015-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This is a subset only specific for MFD changes for Airoha AN8855
switch support.

The old series with all the patches can be reached here [1]
Changelog is included in the same link

[1] https://lore.kernel.org/all/20261009161102.38961-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 579 ++++++++++++++++++
 4 files changed, 770 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

