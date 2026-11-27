Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806596;
	b=UTWcYz/XqsoRP36/VbgsU3iRk9qBOiFMx41fGl7s/nTnbUkDTNgK5AcBAh5Wzf2tUu2E
	 fclhR3V19qC/WUZrfa+rTnPLpPdC9qc+xTxaHQMDpRM9vC4bEyz4i5AECeFkNpi2JuvKr
	 lfhJFDESlCXAhJYzEfLYX3aCmu8A9CV1wtybqh6B+xwx/GhRosfpvDCDH4kNaO4JpAsSy
	 DkyCFiXKLBZASFQl/QYiyHcrJgqy9OvopanEvoh/Qi7y/CONM175CyJzFuBwEZqnSD42p
	 lWWIFllcMJtd0H05tstX8VjnDzyT+gp73hWsCAEDYKGE4nTd8CjTYp4xrRa99It1DCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pPqjsPGv3eilo8FZQHSgEFw+4wPb6iLEdkbWG7h8j1k=;
	b=mRR4wbPoYKU3TbvgwQrDdtsqz4fpOsBlZ20oBSRrXJw6MbQe7Tnh9H5LhxdAvvahaqxG
	 akRMqgUSZhSoJP/9oCEKS0icVrmIgEkfN8KxueWE5+2CYxw45bH/ztNrlZNfPc0/zNK4Y
	 FR8B/fnqM45d4XfkLIz6m+WaBmlnBJMPqU/BkHN1jal/X4hampBsaccj5Z7EJJ5WslDEp
	 AcAwKwCIDpmAblhcx2reJ+dZaR3yRf0EsONkYuIMogMjSJyUrX75wuhA/Akvq3pJxmeIP
	 JrpIujJw0mdf6MtOQpjyATAYIww5FMyGPhtY3ZQ0q/OXyIC18cweOvrL3OkmE4bv/dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V6MBtyKx;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7150D606A31F
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7150D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V6MBtyKx
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso7451044a12.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806594; x=1796411394; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pPqjsPGv3eilo8FZQHSgEFw+4wPb6iLEdkbWG7h8j1k=;
        b=V6MBtyKxBfLZJ1LFmwJ34sZtKodozTQYZY2lviCbzWq/e3wNhaYDyyB+5XrtnRh9y7
         GjkIf35rFw5mGttw9c6w5a5M2f3m8HUEXHCUZ4uB+cP8dAYGZAdUV/sUPnAvXyq/7coS
         I7LmhMPwcoNTRlfISagLkuOphdIF/Wl/qvHHT4k6p3wuwCfAtRn1DZUgiYPvkNLZU0s0
         r1gZ36BEvikcWPgiHZ7pjERPehlwgIEyKuGN15nuwZY7/mzHOMs7+tElBNNRlB474R7x
         6BLI/f+1lcTqgNn/QzY3Qn5CzSlbuLc9mZrvCa365p/EVvU1Zuw2BIlu+HSbbEbay4C6
         hENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806594; x=1796411394;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPqjsPGv3eilo8FZQHSgEFw+4wPb6iLEdkbWG7h8j1k=;
        b=Sd7FZjHoH8w0uBTS9quAn3oOhrmuvuyihnArlGgkzEMbgMbOEwF1a5OOrpBQCx9wQw
         YNsL8E3GDNbZiElqXkzvOwDuoo+lbJc6xs2qgLYAG2d7r2+L/6o0olYF+rMUsoa6c0cb
         p50mjXAkbhocl1siTYYMMpi6TFczsRrJbne59nITmO5PyrwCp4gsff0emA+BxCvhk0EA
         LtNdhALM/qkqPjxO0TGjqRz/xwlq09zMxoG/LKt9c49wMsPYlEfkT9hq3rqH2lCj7gkS
         eFfb+Btz8oGhlGIznrdXnaTsMw6p+xyVpyjj9rTB1ESLQbzpYE1/NDzszGLEyv3Vdl5k
         OItA==
X-Forwarded-Encrypted: i=1; AL+hErEDm2JfE/t4xwm26see0XZiuqR3Fy4gkudFCpzxKuRtH7v+CHjc47GcP8NpiNQ/WKhNZ2w=@lists.linux.dev
X-Gm-Message-State: APuU4Z8LbxQjzIKNUf5jZYTElsEuxWT+TZ1LmQNV3KeqbDRvInmUQy9A
	xrnvCes6AhVKPamRGHIj/XsTYmaMdvFk/rX8+qXaiO2ycntjy2qQlliomDYw/ZK7btc=
X-Gm-Gg: AZFdTZf5wPK56jaR7apFmG9BA95/eP50fwt6E4VhsZfTyuqvcaGZYjcK8jcSqPpkRxU
	GaBsQDyFnnCyqEcUAOGZ7VdzXp1Wggpkw9VPwA4KMvjiUykbpSz5w+G6ZwPB0Pz6uZwymN7FDQr
	ou5fAvMCWyw3nop9mCRZAtCiWjJXVgxa6rXbGz8+iGQAiVFPm6lWPy0z+kAzWo4ccjXKdi+FEpX
	tNYq+TscujIdEHbhUBaQi2vK5Sf+uWBNSFU8o58aFHPVpfmamb0Jfzlc42QJQH1uSqJW8e3AAcv
	IoSPRU8I6dpBrMPEhW9JyhjLjr4pNQTKYndyY3h8OUzQAH+N3nIjMMZyIMu88/QoqJoAQLLP00A
	HTgzfyUsCV1qGVkeqCN//zPMRREAH2IkmdTwtduybcZOZ11xnDtGpiRb/dMbJoYhG3aO7EcU3iB
	tL0d+wYOFq801RBPrfQfCGNYUHxu+mnJ2MltOhY1/HoAxD3oAU5UeVXe4PrJednWC15CAH4Va0d
	1GEl/aSdqzJZzHulgtuOMZEdKIwPJTR96AbKcG3TgQABmxaPjsq0tjE8eFKNxmjioOWLGL6pvZb
	3tzHAaZpuK7/3TSey7lBo3uVBO3BdMix7YAmLBXJxTkvUnwvQ/R6jHg15XKiZVKyHQcf4i6Palr
	BW3lihSFvxBsum0iRKQ==
X-Received: by 2002:a17:906:c10e:b0:c41:5e31:5184 with SMTP id a640c23a62f3a-c513a99abe6mr2111709066b.13.1795806593819;
        Fri, 27 Nov 2026 11:09:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/6] power: supply: max77759: UAF, charger ABI, input
 limit, and supplier fixes
Date: Fri, 27 Nov 2026 19:09:51 +0000
Message-Id: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH/VCWsC/x3LSwqAMAwA0atI1gZspQa9irioGjULP6QgQvHuB
 pfDYzIkVuEEXZFB+ZYk52HhygKmLR4ro8zW4CvfOOcD7vEhotCisa6suMjDCaObxkD1HKpIYPO
 l/IO9/fC+HzyzkaNoAAAA
X-Change-ID: 20261125-max77759-charger-fixes-a1cb573d50a7
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3

Hi,

Patches 1-5 are self-contained fixes for stable backporting with no
external dependencies. Patch 6 fixes supplier tracking to follow the
DT power-supplies relation instead of matching any "tcpm-source*"
supply by name; it carries Cc: stable+noautosel@kernel.org because it
requires v7.3+ power_supply_desc.init, the v7.4+ in-tree DTS
power-supplies property, and the core fixes listed below.

Summary:
- Fix a use-after-free of chg->tcpm_psy when the TCPM supplier unbinds.
- Report and program constant charge voltage in microvolts instead of
  millivolts.
- Disable AUTOIBUS alongside CHGIN_ILIM instead of relying on firmware
  state.
- Notify userspace and downstream consumers when supplier updates change
  the charger mode or input current limit.
- Sync existing supplier state at the end of probe so events emitted
  before probe or charger module reload are not missed.
- Follow the DT power-supplies relation via .external_power_changed
  instead of matching "tcpm-source" via the global notifier.

Prerequisites:
- power: supply: core: give each supply's epc_sem its own lockdep class
  https://lore.kernel.org/r/20261125-power-supply-epc-lockdep-key-v1-1-c8a41b8a4470@gmail.com
  Required for patch 6, which calls
  power_supply_get_property_from_supplier() from
  .external_power_changed and would otherwise trigger a PROVE_LOCKING
  false-positive recursive-lock warning on the first supplier event.
- power: supply: core: fix use-after-free of supplier names
  https://lore.kernel.org/r/20261126-psy-core-supplier-fixes-v1-1-33de6aa53cd8@linaro.org
  Fixes a pre-existing power_supply core UAF on supplier unbind/reload
  whenever DT power-supplies is populated (since the base driver already
  passes psy_cfg.fwnode), which is hit during supplier reload testing
  and by patch 6's supplier lookups.

Tested on Pixel 6 (Oriole) with USB-C charging, tcpci_maxim and
max77759_charger unload/reload cycles, and lockdep enabled.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (6):
      power: supply: max77759: fix use-after-free of tcpm_psy
      power: supply: max77759: report charge voltage in uV
      power: supply: max77759: disable AUTOIBUS for CHGIN_ILIM
      power: supply: max77759: notify on mode or input limit change
      power: supply: max77759: sync supplier state at probe
      power: supply: max77759: follow the supplier from DT

 drivers/power/supply/max77759_charger.c | 244 +++++++++++++-------------------
 include/linux/mfd/max77759.h            |   1 +
 2 files changed, 100 insertions(+), 145 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-max77759-charger-fixes-a1cb573d50a7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

