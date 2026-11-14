Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626737;
	b=5tE19kWerFiwx3Fg4OWPfgIr24v7p/EzmxBSFSSpFEx/l24yNgPxfzQifCDbPpcBmpGV
	 oR4KbsU3ZxRbQJkvQFk1Qxi0pc5bzEA8550B+CdSDLPOh7lPI3CAcWMHLh5ByRKTuVQe+
	 yHW0AJQNW6hBsqsG3i+QAN+iMIu0tE3K5zF4q3ZplxJ97glZsNUxBRuW1C6kS02sURdpl
	 Ow2fftDmhEJm884EoUMFhzOueuWm/90NXwaLkmK20U893Ed8/eN8F3ZYRLeWoOrr52LBC
	 XaGkpG+4aOupWABwiNdfPlM92KBNvb4P9F/MMsBNZQZ2FDvO0xw6DkUZfCuNMv/Zc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626737;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=oyAxY85GFEZYnIl3FuV7SY+GGs/c3oBnxtIqltqNgug=;
	b=zLkIaoyab022tAW0MmeiEUdAkFuOfKPIQ3FTPJ4jKWHrIpBvkyK7oL8I2wbShgnRlu2h
	 hgbgj1TUsTyNbTzl4wpzQsTG4gVMU0/HA0hNFVnX61OWDIK10e3oEjpLmaVC390VDktAN
	 +SCil4ee9DEY7eoRmu/2WBHsL+ZAY3E4bRPPuLAJ3ia6HrfXwByDHzKK9s3US72N+Ijzf
	 KacYbpiDSEkGC455v8ExmIuqewakiT8FzZ4RLGH/EaNRfwuw/3ZNa1AlK9TyfNcNgkK5p
	 2geTg1DnwTyGtgrS9eOmaSN8gpY15Or/4RTHzd2z1hWIlq1kj4vzrr21BugPfFaoDnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=CAn1GsUi;
	arc=none smtp.remote-ip=198.54.127.67
Received: from out-zbxj-a67.jellyfish.systems (out-zbxj-a67.jellyfish.systems [198.54.127.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796A606A331
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 03:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D796A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=CAn1GsUi
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jRKJH5dDlzyNc;
	Sat, 14 Nov 2026 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794626726;
	bh=oyAxY85GFEZYnIl3FuV7SY+GGs/c3oBnxtIqltqNgug=;
	h=From:To:Cc:Subject:Date:From;
	b=CAn1GsUirKL6+dqPmQs2DDDkuZtVTJlE95li865Nv4fHZ2ZNUMdEfAjT5W3XhBckg
	 j0rF58kSQF6mUzGYdghtHabY4bsU4hWjtrlsaWic1GRJaVlc/Mp+tPhEwtEfRGXrqm
	 BNPTQS+P03qmLohFi6ODkQ4Ag2IY9wTh0DYBhNpHmLnYZmMJXWhUbxgjwcPcoOf+vh
	 6I6ybprVC7Zodz9M9oAZuBZ/sYFCJHuL/VVBlWDC8YZ3VHaLgfKkHaUkv0Z7VK4l1T
	 N3mHu5C/L/BpmlB+m1ENc19futqHtdGRd2zP5nWIdZgrGePuIGEbvnMbWBMjyL+ViW
	 iRJMDlxqNSkeA==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 0/3] mfd: tps65219: Let a board run past the warm threshold
Date: Sat, 14 Nov 2026 06:24:53 +0300
Message-ID: <20261114032457.3434248-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

The TPS65219 has four die temperature sensors, each with a warm and a
hot threshold. With a sensor's warm warning unmasked, the PMIC sequences
all its outputs down at the warm threshold, 110 to 130 C. With all four
masked, it only reports the warning and powers off at the hot threshold,
130 to 150 C. The masks come from NVM, so a board that wants the second
behaviour has to set them on every boot.

The BLIIoT ARMxy BL350, an AM6254 industrial controller rated to 85 C
ambient, ships a vendor kernel that does this from a devicetree flag.
This series adds a binding for it and the driver code, and corrects the
MASK_EFFECT macro on the way: it named bits 2:1 of MASK_CONFIG, which
are warm masks, instead of bits 6:5. Nothing used it yet.

The property is limited to the TPS65219. I have not checked the
MASK_CONFIG layout of the TPS65214 and TPS65215.

This series is build-tested for arm64 with W=1, and dt_binding_check
passes. It has not run on a board in this form. On a BL350, the
vendor's equivalent code sets the same four bits, and the PMIC reads
MASK_CONFIG = 0xef.

Chrispine Tinega (3):
  mfd: tps65219: Correct the MASK_EFFECT field of MASK_CONFIG
  regulator: dt-bindings: ti,tps65219: Add ti,no-warm-shutdown
  mfd: tps65219: Keep running past the warm threshold when asked

 .../bindings/regulator/ti,tps65219.yaml           | 11 +++++++++++
 drivers/mfd/tps65219.c                            | 15 +++++++++++++++
 include/linux/mfd/tps65219.h                      |  8 ++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.53.0

