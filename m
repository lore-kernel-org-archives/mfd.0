Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737849;
	b=zZ9HtNzHOAgr1x9Ts4iDJm1PoJJPuRxNGpJ7KwSgAhGC9aN1rqY3nMaUMk64nlGGaE+1
	 Qmrc21oNU5M081vaXVdzI0gOLLQUKd/zIatcXoVUiqjN2JXFS+7EodycRtDkDnyzOViGd
	 k1qqmg1u+ZuiqHfu21gj1QJemPZyUdGcljQNrnWyABuxPmXFK5Y2l17oT5OQbPPhEK5Cp
	 tWzN27Qm2ncptzpK7pxkhMgtAOtZ+6PhWnZWYQbno9jrUA+iL0aBYp63Xb78SlJsGKbj4
	 JtL/IjUoN1r1HhI2GYroXX7VUjpQErCM11cj4EUfBPZ4dM6kM/XXyIdxJWai/BNiFYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
	b=c4bTq7kxYUZldyQmFF9fBWMZosYLLYQPzg4aFvoI/OjeAgTi5kE5UaIOn2jFuEptic1b
	 /Ba8hbRaoXWZ5pRocE7gZegcX+paimeLpsT2NN4aWciqIWq0RvRQ0MW1tH/Kf/zE8kdEn
	 i7+TLCrt23FHf7kjG2dGWJjwB+m/zL61rQpFphk9Q6x2Rk18Ko1R0HHrBO7hP8sVk2Hnw
	 beV62qjR1LxpS4kXB9FTs/2IGNl3pm5SiJN4DRl2dnptFLwys75ZJO2hNrT7ahcwnqJZF
	 IE0oOQIYQ2LlzXxoevdpifVXRYL2c04ew1ioT7HmR6KGJ3cm8y0JmJY0xi545LGhojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbEkxkNJ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A6606A31B
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 20:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927A6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbEkxkNJ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so37448025e9.0
        for <mfd@lists.linux.dev>; Tue, 03 Nov 2026 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737848; x=1794342648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
        b=sbEkxkNJTIPmDn6OuXgL0auXQ19SxKC0LSi3t0k3LQh8iP6fxCVe/JgsscS4OpAtj8
         d6H26g46HCwkod4ROSpkhXg1HunT6nIJU2Ahu7UWSIQM/yNiXjvI4tIN+NfGl8rjvgfz
         PvaYWkoA9tA67oY7SZ0+VV+hsZfLBfnO7+6HAvouua8vd5rwFBAcnQe6XA5LdG0LDE5+
         nl9FOI970egrcP58MAgmmHT4RMRsukCK+zmFD08o/1dFNDDcKP4+V1mRlrCwuacUd6HB
         1e/gpJdIwPbAo3wT/jNiaTbE+ZEkeXaT+chJIajQWddQc7HIEFoHN2StyH27LUkM38t+
         vH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737848; x=1794342648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
        b=ZycFq1inEzC4DajVN8fboOLoq0fwcBc9Iq2jweanE8dLMdIwPor08kn75BK5Qr96kE
         mUvlmhu0qTniEoSRgHfmLRkUBK6gz+dk7n04mDZDpfPsfuSRjkEtPc+6SJ1vE4ODmj8+
         KCuPOFk7M5TOXKCR670z7SiHNcQhXpwEw3uVrzYpK5OM2yTlAcw2y3slNUR9Cy2IPBME
         mEcTbfZY0jk40jHMG/SxCRLxJfK0UnVae9bTmyC85lG5y5WmdSU38QuU1WmvUCV9l8A+
         p2GN804qIdzSwJEqsUzXBUWyVWOwzh4kkV0+C27Z4VFcH3HqBekuUDpj2jNK9NK67oUe
         ehLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJgxludcev2BL+H/yXNhs9nOG8xMbaJGC0t9PKVZKaLsnLiOMCkG1nXvLErgr/Sr7Cnds=@lists.linux.dev
X-Gm-Message-State: APuU4Z/1+IQKdf7TBimIAGv7SbXY1YMkT8uok243GwZuXtD6P4Jbv6IP
	1EaWZyR0/jm4CvtPVPUXvWX8mVLPfJKB7pVhTQYjzr73D5buCihTU10s
X-Gm-Gg: AYBFou2t43M5AbttjawRFH0lBwHs1cZLABZzYgaXuQk2zn63c7lW9cv9BzXvR2kOqHw
	iJ4l0c24vSs3q4oVr08dGAt35qloO+4pbA5RtrV8l92gwZLd8YuoaIdMa7ea2gEcxxIP7522jI7
	LePAyZT1IKu0M0pyyst50XmAoSMUDl/4KuNUwGOV1xfYCzhx526IrI6mnp9CfhgLSMomfomtmTn
	kMKyseVX1AVtfvUXBdX8OudAgwsCs4hvgtemh50dCemrUs7qVAXxCMLIGLurY+cxhZ1MXvhF3x4
	gcq4Xa26CVmB8WPrSGiIaSvQEbmi1SWTkdUdhMqYkhQrXEA/kWYk28EAmuyFM2G7Y/I2TJP8Q6M
	p9B9ykQgXxdO+LbTunVQe65hS4OckTgOZx3QyAovs7Z3Xc35U6Q6qRuoUE3QIlOzxr1Aezd1hd/
	sayuJa3Gmp5NDEFrAdkNtn1jLo4opiLFQ6tnq/qNGME1Qmc4GYivkW0Lp7OPaPiVsimpdGO3X8e
	agNjXyYRUG+BH1lZ7SIgVuBUOJQomI8fBeI4ipa99BgPfhGhdteP2gSpHBlmbgQ9WiAZzFIhXm/
	tZ4DQpKKG5Df7yhmB09aHIeL2w3jA3pVXhVM1osT/DPuthq+4iTYWan7pYPEo8D+Le1AcS7d4Gh
	ng3JLJ7h5sYaYDs26sy+QfmneIUNtmnO0pg==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr323378835e9.18.1793737848028;
        Tue, 03 Nov 2026 12:30:48 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm75110245e9.4.2026.11.03.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:30:47 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] an8855: add MFD driver
Date: Tue,  3 Nov 2026 21:30:30 +0100
Message-ID: <20261103203034.12869-1-ansuelsmth@gmail.com>
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

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (2):
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 134 ++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 579 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

