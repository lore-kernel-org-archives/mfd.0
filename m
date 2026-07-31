Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937903F65FB
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497819; cv=none; b=dAwpPKahtsyPex6cvkJbYI0QBw7fVahACE90FpqwLe8nNoWjlP/KIIk+nOWu7xWOuZtEnlQPr2Pv0PK+3q9VkBB40CwO/FewoYP1at0TU2TOgRIRTnm4rpoez/6qLwoIUtnQoyf+umd+KmotVq3LPfAWJvhUeQh7Feg0CtaYJXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497819; c=relaxed/simple;
	bh=g/XAR49fFVzuq467Ik799+2FdWOn/LGc0r4Y6IP8+yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBw8FY79rw0p3fPvdyUHq4reEDODMr9LXFnn5NbOvYU8wCkY25mBYbMgB77/f1EkjxTAIfkSkMfr5Wd/ZOWjX+SggMAHXbhHn9WHykUseOzaTX1vCNxF5bTf8iMKGGUvepJvTL9Hn3Ywz5ZYF6GR80VjJ4CX6Ge1FTk330DkZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmV+qQwG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmV+qQwG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f7027ca11so577913f8f.3
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497816; x=1786102616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwovEeXaCAdfULQBEy/htRRSiSsUVEDD/fWA6pMEZ8M=;
        b=EmV+qQwGylow+mads1x9yIWOS/uXw/qpiKWMMZwlBgh4ZGYAVgjUcen7EJtclodfkI
         NRpfm6t+n516OFpVtXb5rrdn+KhufSC36/VY2K1TU8CY6RTvM1uXmZG7louxU6yzWfGo
         ltkWNfZFohckJRN1tGKlBQMyoSX/azBuA5NJdGuotndiq4z36pY8nUELK220hxcBa9M+
         Mnzy6zcuqLnor7DUMnI1DUSXLQZlk/GeqwFiMzto1Ivz4GVzqJPPSEMFNQjZQ7q1uKC1
         opd2IyQeKwltUJqc7HTCZe56E8RyZsIQbILcT3U7r7NUvERxlCKXF77sF7KLGxxwR1om
         1Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497816; x=1786102616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwovEeXaCAdfULQBEy/htRRSiSsUVEDD/fWA6pMEZ8M=;
        b=BT0k0fkRx2132yeOmrCxsSjEFlbAx64rmcjfSsusvNjELRXJIo19TUUA5uHtd3NABq
         6uot2ujYSC9orSqmogCgCIoMLQqLxrG2Lsm/0rWUceDVKCLC7oBTAeL/koFftH157e/f
         W/9aRcd4kDsr2FpyDaf8aK3AAtRf2rvjWY0JPnA76I4tKCIsTJ8k4RGxSWPCoZAJ3zZS
         d4vDK2GjMLei5KIxY6EyeynB/qMM1fs2MNCIjjIbQW48WZBr/AwFsOzQBgxGDOo3GUde
         VlzHq/37y0QHdmNMAWd/TpWoGB1CloXC6HiqEcILJbuGTwsnVyHa9xoK+gHPBA3u6uUA
         XDQg==
X-Forwarded-Encrypted: i=1; AHgh+RoLVym4P+ydmKHdXPMHt90pZ8yL/2buMXNuRAnoo/co8jkpwK/WYOnZQpOiplXQRfC6J/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfmJANUq6rwxEvIs7twVy6I/Lhi6K9fxjyA91J4Rw6hn+20v2x
	bMkYrHx4u/0n9J03qpslMDtMrAomSHNnUG2QkCggb+mWhhdWuG/Llnne
X-Gm-Gg: AR+sD11Skf98DurU2cz8SUKFifOZWBPs1bznpM2USEee7yAdoxKuKwCTrbMyaXlSg7p
	JWomQapzyvNt7t1c1M3QPsFxsxQC9XQ2EISYX3a6PIua0TVNP61EUSah3ym9qoRtVmD/R4yNQPs
	0OAsJrdoGcYscXdQML0tUHBqdbZutyWXvA7G1qAIC+frbmKhJtRZr7ohL+AVMV4ohnO8xT2Sac4
	2ConVChmD3qv64yODyNTav3KLGy+pRuE6/6+Xkyi1u5v+YUO/BeD10fM4MjzOKPKiHXX/W7HeJj
	vyBus1TlsXnmyztZHWG3Csx55zT7DJ8+GLh/pESZS3yhw+373vSWs/tDITBUcNNs+YgQ9+ijUJx
	kWIZtttv9bezIGDd5OyFrL9yUd5BT479u3lsr9mdTvcb3CVPSVVNDMbMRlFIIDXFNSifiHYb6z8
	8eTexaFRA8Y9YC0QwUZPreICpqEnHhoze9VRGyLpY1nW1wmID8oVANkEfvpVVWKJdXKODHfW2RA
	CB7jtsmZw==
X-Received: by 2002:a05:6000:41c9:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fd2abad19mr3920947f8f.3.1785497815591;
        Fri, 31 Jul 2026 04:36:55 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:36:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 03/14] mfd: lm3533: Remove extern from shared functions in the header
Date: Fri, 31 Jul 2026 14:36:21 +0300
Message-ID: <20260731113632.158440-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using 'extern' is not required, drop them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 include/linux/mfd/lm3533.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3463b164d0c17..c4c38876c09bb 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -82,13 +82,13 @@ struct lm3533_platform_data {
 	int num_leds;
 };
 
-extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
-extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
-
-extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
-extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
-extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
+int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
+
+int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
+int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
 
 #endif	/* __LINUX_MFD_LM3533_H */
-- 
2.53.0

