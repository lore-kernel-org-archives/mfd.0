Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880121;
	b=byCIb1P2Ojys8JwyWuBajaF8CGNA8RUx3BhwMUZhSS5s1ooWYEPy7aKsCc/Q2UStW4MZ
	 wcjMQeMaGYy/ohkjBayrGdsJ3NUwrBxdPYQcLKFbb3mjxnt3KxQPcnCfCOl60LPtVR06u
	 Rm2QulZu5IV265Qbk11uC+v/M/vrI/TmoOdA+w1CWABzaXhiBsnH3xr5hN2VRC/3KJsBw
	 aQUZehbCBJbH5Bwau1eEe2a1gpWfJddIjdfCu3FxuvWZUjPSbCA3VzcXgOAygw0G8p3CU
	 ++reafessj9AZoty0LRX2JvGbDarGVVlOPhuMUeiy5MK7CHHQKZEXaYwSoOPb0fxtZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
	b=4UrO9aBLN/UvJcwCJKCkOcp06qTBKQMO533hRs8y4a5Ffogb8TGwULNhr31y++AVu6fx
	 FEU/TorpcyrGxyny2QaB4Bf4c2FpbiuBZv+16z28NXR228ZqXVhC1Dq9NAvrDP1T2ZUXz
	 Q9uGpweUpZS9qxW5pzgx6JU54Ude+YpcB4cXyJ+92uf9FIMmebVzzkqeFRfGZ71bGV5sd
	 KLffcyCR5nxhux1b7xhKk+XOyAGFiJIgbROy7Ofz4A8aNpGzCjnqULHJkgn3z7uIpS5Wr
	 ZdmHGFVHQGb1KJcG38G4DT4WzfsTLj0VUg4YBHDxbw8zIaCiZKINiJ/Efzev7ewxPzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw9X5xj6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC0606A31F
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05EC0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw9X5xj6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso85990845e9.3
        for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880119; x=1796484919; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
        b=rw9X5xj6VENHVL+G/c8AcukYFpcm/pNcu38f1S9nbEQFxBWFtNi7Rw6EtyUcrga6se
         Kmcjy2fCArYcYEAYUoFisCDa8naGHLvk4VrYfy3wiRWUBF83thNFKLx3B59//eV56IzT
         0kIwAwsFI9XgVI1Ws1c96MibmZr7OkELfkkc13bEBvy2oWJvGOd7LoZ2yOEtl+tHJUzd
         7U3n5QRJ0y8bqERcAYqXEP4URvaIdcqRtKB3gBkAnf+0ZguLBo1yFo/NOezgtcULj6Kb
         /hlnmi9rj+R2lm0dB1QbYWyGO2KCD+DjtcVGzDI7r7NsMFDLWkhFvPOyp8ZPxDvFxTNg
         1TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880119; x=1796484919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
        b=czGYc3sLsUs+o/5uq+ctoCORMUFTRRIRGQ638EAzYT6WN7TBj1SZwOBz0a/2oSVp10
         89pVVMaq99xorXFYtsTjxo7HjKQZ2Js/Dcmfr0QoInZEtwQWsZdqnAyEJs8NnXSNMOO0
         e15SKoTKWtuK0R0XWza+iPEGt+dYD8iOAKoGcGNWuXqQDlAWPevIWmsvhBevP+u88j4j
         vb4Fb1ZYcwLqV8rBLEjG2jwSMXd7r/Mn3HTBRM50PdrSVbU0U/O4CLhE0m9i3Hqpgn3/
         7jg/L1eyNXrmBprMGJfIVt5CKUzS8i8NsVSvtAMX2Ro7VLf2XmTIa5egxvC874I9euGV
         CIYQ==
X-Gm-Message-State: APuU4Z+ofBxddrBrc9o9eUtmVJD0fVaFMfW/QDXJ5nPdxXKfYGMwpFz8
	sADYkJyRDOE31/Eebpby36UsP8KqQlzj2mJ2706b8+l87rbUIsmNUpy3
X-Gm-Gg: AZFdTZdpqoZ9+XUevrS+auRcdvek4Tvngft6JDfLN71tM3D5/6/eySw8KJbATMwuWvK
	GFl7HddG4ksp+Zc8z45WWZhbrf3PbLo6+bN1B/ahieY+Zt2Aes4VT5plBMSdH8nietwejWC1+pu
	27xyQ5NCektrQ0q493PV7Y0VsRqoqiusBci3/HF3YRHE9o3ZP57B/lauOyCnr6rG3uClxhimNWA
	AYTrcaoJQIKvFxN3mKIYkJF12HXQMpQNTdQOYwR3EEHiyuy9rLsbFHiPqOy9ZrDZKBRnvXP2FCQ
	elDZfzUiH7KBJnoL55ZPyOWqYU+HgELo3VGr9WOiqBpV7yqJvQQRJKL9C23a3p0kVR1/+0gaAJY
	bOalh47chzbdCrqOdoWOoA928pnjt96zNwMsYIhs05hwfkeQUhE+hPtabiZ4HJ8kAe8JeL3ldCf
	3ZQDStVE1R/hfkbSsrPhzgZQoAUpxzGKToq7QATFkVyUt1OXPNlbPu+H0AeCZOBkWkUZrOKOf3S
	crt8WI7rYB8HvPVdBw0V7wFZ5ktoIALbOmlt5b4SeJjQlRZpI6wris0WUrCX8NtIvvuScK0XbtQ
	U8OkJmcDTyDITqP7JtivsRymrG9nDBX5dLdAh838
X-Received: by 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr556620835e9.24.1795880119211;
        Sat, 28 Nov 2026 07:35:19 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:18 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 0/4] ARM: tegra: Fix warm restarts on Tegra20
Date: Sat, 28 Nov 2026 16:34:56 +0100
Message-Id: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBAF0KtM/ppJ2oqE9CrGBdSpDAsgnWJMC
 Hc36vJt3gGTomKIdKDIS03XBZF8Q0jTsDyF9YFICC503oeea3Bsa65cxKRyHlx/SW5sr9KiIWx
 Fsr5/4e3+t+3jLKl+F5znB7VTWRZyAAAA
X-Change-ID: 20261128-t20-soft-reset-fa083c0b45e4
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=dU0F1WkbTG8tFNzFBXxX/HgRAHkTJjQlSwyPPAIbYfM=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl/UBP2p+Kpy3rF/9YXNZ3e8iixmz5b98nOivaGb/b
 5JvR9jejlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRD/aMDLs+LZzxss7hRKui
 3pyuTSq9LS3/3ynsOPfPWHdJtlVgwFpGhmt7Ty4T0W3/9cbL2pVdJNx1m9NZo10d5yd0PYhasMB
 xIwMA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

On Tegra20 boards with a TPS6586x PMIC, every restart is a cold restart:
the PMIC restart handler has a higher priority than the PMC one and
power cycles the whole board, regardless of the configured reboot mode.
That includes RAM, which makes pstore unreliable, and was the main
motivation for this series. Testing has also shown that warm reboots
are more reliable on my TF101: on cold reboots the board tends to just
power off, which breaks automated kernel build/deploy/reboot loops,
while with warm reboots (and the latest U-Boot) I haven't observed any
boot issues.

This series does three things:
- it fixes warm reboots on boards with a TPS6586x,
- it registers the PMC restart handler much earlier, so that kernel
  panics that happen before the regulator driver is brought up are able
  to reset the board,
- it improves the old workaround for the boot ROM hanging on a warm
  reset, which now also covers emergency restarts. Without it, boards
  that don't have a PMIC restart handler, and therefore reset through
  the PMC, hang if the restart was triggered by a panic.

Patches were created with help of Claude. I've tested them on ASUS
TF101.

---
Patch 4 is a cleanup of the old workaround, requires patch 3.

To: Lee Jones <lee@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Hans Verkuil <hverkuil@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: clamor95@gmail.com
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>

---
Artur Kowalski (4):
      mfd: tps6586x: Leave warm and soft restarts to other handlers
      soc/tegra: pmc: Register restart handler from early init on ARM
      soc/tegra: pmc: Power up VDE partition before restarting Tegra20
      media: tegra-vde: Drop warm restart workaround

 drivers/media/platform/nvidia/tegra-vde/vde.c | 24 +------
 drivers/mfd/tps6586x.c                        |  3 +
 drivers/soc/tegra/pmc.c                       | 99 ++++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 40 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261128-t20-soft-reset-fa083c0b45e4

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

