Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0C3B3C0E
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132102; cv=none; b=TLgy0HqrJbouimoN0Oz7A2brvBUfe+IgEyIcLHp9wseKAWxnONuP1CtjVieNljRUPfa+d6pKMttDDBQII37hARpd0q4Go6pCkpwy4DUT5r8Xdz+jsT86k0y4o3xb9INBgjxftaTq6NDZ8CTJPMGcbMMZdQQ0gv3b+axMYyopi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132102; c=relaxed/simple;
	bh=3k9GVNmC9fpGnUpd0cb5oMJrSKHcYAq6Yd3jt5gP8YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzunsGiWjQN6SRfAwWK95BJAIMVngPOSJpOOg9SG+frklreSZTczE85PcE7M0wprEjUalPBuKHk/EOx3TDNCACQIY/ECoQ2ifiguRc6AFeDw+NRRd3V3MBi1QdilcnwXitGqBY5wTnALf6e6SRvw6rz2hXOl3XYu2Ny8kKAtfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGwAJkqN; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGwAJkqN"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so828986f8f.0
        for <mfd@lists.linux.dev>; Sun, 04 Oct 2026 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132099; x=1791736899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hI0d17TUb2l8DVdqo6tZX+Y2V30OOpneqbxvA1IJE7k=;
        b=RGwAJkqNjPwaWWbtVmV+zwXZTWVGKGPj11WVIGKCOtZkw3H58lrGkxFqD7Z2P65BPV
         za7QRGU+lrl+OY617+2NBG3NqU+OvClxHbcLFB+aOXKHWXhy8S0+YZaK1BloOHD/I4/D
         bLFRR4s02lSEfpXaUPa5Mmh8n7Xr3kCb6eFqW/TxYQKqplu1/oGjiTWdBdU8Uib1I8rP
         ZsbRSVoBjg7wO8vn7qopfdl2P8tcyAk7izvjCh7rwywTgmOP/LbTwE4ujdof+zAM8DqL
         rin7444uWsV+9RYQW5ffp0Z7dEf8WasSi6kxr/XjdmSPI5bwezBohXsyP85yxGdHvkWF
         c4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132099; x=1791736899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hI0d17TUb2l8DVdqo6tZX+Y2V30OOpneqbxvA1IJE7k=;
        b=jxSxaT52ecALcPJAzM3Y9GIWA18f75m3wX6N+XY51lg3OOXi/QCCIWvSMQyLFwGYhj
         P49k3FhAy3wHWl5NJW9tGeXaPtd/QwBFyZD/mh4Cafpig7bZT10ySachyU51Xahxxv0g
         3eHqf69u9GeDjOjlSXbTWwSOebuavsGnknuWoK/23sGwH/IE3ET2TW2hLJMdrNN5lRtG
         CCN1qWiDK276JBcL7QZCGRz3JhpCX20uNQRRN6pzqs5UqWpQC1HC6EuIV9z5PO4EmPwn
         w1K3YYgtFBfCWN7SnujmmZ3v3UopVpyO/KNqv0yuRJJG5wyy51DhaMUj4IW+G4UlYhO0
         XdYg==
X-Forwarded-Encrypted: i=1; AKwUvBxuBjZdoQhYXygJv6pByXfvd2O4BUdD/oUdZynUVy4i2CAA7/E8FjVc68ZrL+bTWiJ+tm0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIBBs1Ovbq6OLVW9db1zTuP7kmkAD0vvp0AHj08PJA0fai4wbN9
	MCgofoP2rE/uWW5v98vr2y/NUIgF1loQCOh//IZuUgjCupd2XgzR2KsX
X-Gm-Gg: AYBFou2LAkJxkoqJnWVb4ArqzvJ89s3p9cxKMBJZolNWTsbTAhM6vSmgr1JPPH6wP2P
	vu9jdLGyjpKEggIwYZ+4zdWflloBoQvxORxMs2k0s/JuQOEVpdmIreKarrDwhAUuk8pjQSvP+Lx
	eLK/32pWjY3TCsTLhwEiVpHlFlyJrEDvDawCEWK6CFJe4wLsq0yl40ao4yF/UMUrmZWXxDnWk3W
	hq5C7Dgs5ZG0CaC+kKTTIXr0258wGBJFo95wgDE3+NMfXkEyEYsXWP9w9eT3K6uZsK09vQUCqhE
	avs3qADnW9GMunvcQeDRVqI/O+LENGeq+A0g7uyVOHRZAEYiL0zb/+n5r69uxb4QBVtdkeiIKIU
	WeFa7NuLo5yKfv4YW2mYko5TqYdl/555QhRET4mxUOtl2fkTHHrHf/bIsGxUraGGSAOjtXMBA60
	lcggKdTJLCYbRnKUj02KVug3LO23eCXbOEAEYB0K98QH5ZH2ZU39gHKAh20s0eugWb19fhCUaRI
	6sIRnZosTMzenP1j/c=
X-Received: by 2002:a05:6000:40ce:b0:487:27f9:835 with SMTP id ffacd0b85a97d-48b1271ad90mr13914155f8f.42.1791132099009;
        Sun, 04 Oct 2026 09:41:39 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm18765185f8f.10.2026.10.04.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:41:38 -0700 (PDT)
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
Subject: [PATCH v2 0/3] mfd: aat2870: Convert to use OF bindings
Date: Sun,  4 Oct 2026 19:41:18 +0300
Message-ID: <20261004164121.193514-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (3):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 +++++------------
 drivers/regulator/aat2870-regulator.c         |  77 ++++++++---
 drivers/video/backlight/aat2870_bl.c          |  55 ++++----
 include/linux/mfd/aat2870.h                   |  95 +------------
 5 files changed, 244 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

