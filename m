Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690119;
	b=edUFqphbJijQt9bGV5qlA3j+eVOjuSCai/hLsocSq4PVQF8Y3rXdcKPb53yhlKBiumMa
	 WJpc8VtEw0A5s6tl8vfGNYI5fhBH/VV59Fg12rcN6sWhAu3sCEqwLtuNj5sbrC/Hyxa2/
	 RluG5gIY8AYTupieMrXkEF3oq8AwZ+qWWRg2m+L2FSjSZhJ8XEZCVATgFvdKt4r8EogA4
	 4LS0PnII5JegzbAtnW4cUPwiqSQJXpRtBJpumL+b6aISNPhQ0KITBAgBfpkvGI28L7A0Y
	 bN9uHRvR/+k1DsimHOmAfRVDIKxr8MSznyy35uQKP+QCk1jFAAkZxNwI1TbnaJnaYjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=q0JMax0vQd34r8Jzb5i5IRxK+8bWWNqoR9qhYGl1CV0=;
	b=x8kV9a7PvNgLUMrjo0ceI7TcQ5QUaOPsvu17c28cFKflk/goTNq32J6yZwrPtGRr+zFJ
	 rgDsHXMUayqgWtRfClJmrxinlLv+6GTEWIShEzLXFPV2Mgo84wwMw5vexWeJSfPldlYLF
	 Qpvtp/9whcBO0hFr+lL/l2y/5o1nOegUhSh5fyu5pqAFES47gt3vkqA41Vp63MQ6h/E2n
	 g1LW+i4z6WpNw/gdI0+4aPyJLd5wOsjwUjeEaO4KY6JBIxQl94tjbkNIBiMnoQ6yjddkP
	 mwkecxqLNfFC6hf6xdj2n47NXcWEbbPX9vdxsGhzhpbyvMwD2fqF3UCKKSUocUQ548w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kUZhRi+Y;
	arc=none smtp.remote-ip=209.85.208.200
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D1E606A32D
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D1E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kUZhRi+Y
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3adf220e5e2so34586881fa.3
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 02:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795690118; x=1796294918; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0JMax0vQd34r8Jzb5i5IRxK+8bWWNqoR9qhYGl1CV0=;
        b=kUZhRi+YaMDd27XheUx7TqjYBsn8SGLs5/TwzPi/0Lt+AFNScHGSqOKTlK8xCjUxq0
         9SUTTqtly6xS1a/qfIZd2etwlZf71uuoDthhXwGVRn0C8pR9fvnpvvGLmxBxH4/ATCzK
         2hR3+DsM0vuihJEVWAQRJbjcSr1Fgw8t2F1kR8VZeIomalZHVvXnr2qHMOkQ1mYN2se7
         Y4J1EXMv7o8a2Q85Fco3aT+A4J2iw0H9zAyujZT/R9LHlA5x1wLRrBg9rkczHaxbO8IR
         VIcfc7UAwyayxV0l+UZNBMCe+wH01riew1nFAbq0zb8eTexTpwL9KZJhBnovX+0A3wiL
         by0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690118; x=1796294918;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0JMax0vQd34r8Jzb5i5IRxK+8bWWNqoR9qhYGl1CV0=;
        b=SLwmfzbqXVvzi40dHdzvxWAXfjaqMRaLKl1AHQ/8AzzllcPC6X6pkUgllqvGHfIUJh
         S2jqHA3NmIA6WZ/hQcL2jwqix99qhNjjMHCr2FrzQlTtPcLzUe0FYbPi6qjpN+otDzPn
         3pO9HhIjxlP7/skzjgXgFrQGvi8YwfVs2zKhTvoAgREj0FJ6VBmZHM/VOWkO2WKfY49n
         1R+6ttDOvEnu+GY9iGKLW8z/1Cza2dh9hinvECgpnnZyy3U7pPP/cnd3gI8aaSp+dajJ
         gAfoJPhCC9hFuS2OPdAvPNWzoOImKgB2v5d8jxOEjZSkW0i7UcRPUawyvexy/BL+Wd+2
         grxA==
X-Forwarded-Encrypted: i=1; AL+hErG1Z6xMsFNUglGfHIka8x+1GKJoH/AdjAg820hlr3feD8H5IkQ9EffXejxXEYJL+AhA6Ls=@lists.linux.dev
X-Gm-Message-State: APuU4Z9pqClX9cV1EDoMFqFRCGe/+Lgo5eurkiYREQSs+MoAgwox+cZK
	vaKHrdy8rrlyMekHM0wf+VYHjrEFqACLPKGLWQa94zgdewQ8vv8kqfIUGmVD21Celv/uEvtlM83
	7YtVYhJk26w==
X-Received: from lflu22.prod.google.com ([2002:ac2:43d6:0:b0:5c1:a392:10d])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:ac2:4f09:0:b0:5c1:57d9:270c
 with SMTP id 2adb3069b0e04-5c1bc8743dcmr5885193e87.46.1795690117479; Thu, 26
 Nov 2026 02:48:37 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126104757.2860272-1-dbalint@google.com>
Subject: [PATCH v2 0/2] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, mfd@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mwojtas@google.com, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds the ChromeOS EC On-Device Power Monitoring
(cros_ec_pwrmon) driver to read onboard power-monitoring ADCs, such as
PAC194x, wired through the embedded controller (EC).

Several ChromeOS platforms are equipped with onboard ADCs connected to
the EC via I2C. The driver interfaces with the EC via the existing
EC_CMD_PWRMON host command API and EC_MKBP_EVENT_PWRMON events to manage
ADC accumulation and expose per-rail accumulated energy through IIO
energy channels and a triggered buffer. The driver is only loaded when
EC_FEATURE_PWRMON is advertised by the EC.

This is a borderline case between IIO and hwmon. IIO is used rather than
hwmon [1] because userspace queries all rails (up to 64) together as a
coherent frame -- for example, to compare per-rail drain contributions
across device-state transitions (such as screen on/off triggering a
snapshot) and to correlate fine-grained ODPM frames with other
timestamped system diagnostics for off-device per-process, per-rail
energy attribution, where relative deltas across channels are as
important as absolute values. Since a single EC latch and MKBP delivery
takes non-trivial bus time, latching per sysfs read across 64 files
would introduce significant inter-channel skid and redundant EC work.
While driver-side caching in hwmon could avoid per-read latching, hwmon
has neither an on-demand trigger ABI to force a fresh latch nor a
timestamp ABI to report the actual latch time (or expose whether a read
hit cached data or crossed a mid-sweep cache expiry), making IIO's
explicit trigger, latch timestamp, and single buffer read a cleaner fit.

Reference to detailed v1 discussion:
[1] https://lore.kernel.org/linux-iio/20261120091022.1459658-1-dbalint@google.com/

Changes in v2:
- Dropped v1 patch 1/3 ("platform/chrome: cros_ec: fix alignment of
  ec_params_pwrmon"), already applied to chrome-platform/for-next
  (346739bcdf65).
- Replaced custom multi-value energy_value sysfs attribute and its ABI
  doc with standard buffer-only IIO_ENERGY channels (.read_label, scale)
  and an IIO triggered buffer with IIO_CHAN_SOFT_TIMESTAMP
  (CLOCK_BOOTTIME); selected IIO_BUFFER and IIO_TRIGGERED_BUFFER in
  Kconfig.
- Replaced wait_queue_head_t with struct completion.
- Grouped per-channel state into struct cros_ec_pwrmon_chan, and used
  aligned_u64 scan buffer.
- Switched EC host commands from legacy cros_ec_cmd_xref_status() to
  cros_ec_cmd(), which manages msg buffers and cleanup automatically.
- Dropped redundant st->ec and st->msg fields, used local params/resp
  variables instead of casts.
- Added an event_size check in the MKBP notifier.
- Fixed signed/unsigned energy integration and channel counting for
  duplicate/out-of-range MKBP events; returned -EINVAL for missing
  channel labels.
- Switched probe error paths to dev_err_probe(), clamped channel count
  with min(), hardcoded indio_dev->name to "cros-ec-pwrmon", switched to
  devm_blocking_notifier_chain_register(), dropped direct
  <linux/mod_devicetable.h> include, and used named initializer with
  "{ }" sentinel in cros_ec_pwrmon_id[].
- Capitalized "Load" in the mfd patch subject.

Daniel Balint (2):
  iio: adc: add cros_ec_pwrmon driver
  mfd: cros_ec: Load cros_ec_pwrmon on supported ECs

 MAINTAINERS                      |   7 +
 drivers/iio/adc/Kconfig          |  13 ++
 drivers/iio/adc/Makefile         |   1 +
 drivers/iio/adc/cros_ec_pwrmon.c | 370 +++++++++++++++++++++++++++++++
 drivers/mfd/cros_ec_dev.c        |   9 +
 5 files changed, 400 insertions(+)
 create mode 100644 drivers/iio/adc/cros_ec_pwrmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.839.g22a8290db9-goog

