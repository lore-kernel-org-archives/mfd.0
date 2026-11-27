Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797674;
	b=b7PlFmPEYAfSZQBf3R1btgzLNO0TgjQYzTnSxriTkxeE1YhqhNp/plTsx+f68b1OArpZ
	 2nRs4/tTKYOldTVdTkMEEP1Z7jMRKwJovl//PVz6pqz1Iqt+qwCz59DaA5ZrJxpFyobS5
	 N1nuLn84MFMM4Hr7Kc9vbKimw+Ti6gmexLckMrRd3WUxeYXdlNx96J/rlx0oBN7C6QivZ
	 /m2h4pk5VfXJ7cCAVz46gMR7bjXWjlNlBtO/F6HkRY7Hi+aJ08uuukCGPA6FD1E81mLgb
	 Ik8jXj1l3iZqu3L3a1UazYgQ7oYvYQzlI6UH4/tXpotK/2XOjIlly3uOSNE1S6u1nUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E+7zW6UhfI3gqV3DdfYb2mC8T84sI8f66dxP7719aj8=;
	b=XR/yhRWef1IrRivhfCGKFN49LIBYtNBelGamg08YlkKO/Bcux5HkUjnBW7evLwJxZLS2
	 j4GO45q+1C5J6BPPH3vZm/dfWc+hUDNcrgz84juyW3Nyu7QjLKAg/8LE6pXmgXxgq8KMk
	 VKGmWVlK+7nW587OipaZrD/gSyditOH8vDjjUYpZRDgghjZcVC6+aQXkdNrhBUNHcYUxQ
	 LCpSD1BtpwJoMqdF6jqkY3mM+fzbUGgEtZT+/nTyRwrvLgRbfvz8OfgnLtD4zXFS6QmCY
	 8G0tkTwTwX4LYUtrivgNowDni0GBPC2/Jre2P+2Uu7atbrSm07ovs4N7XPcXpZG27gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiRIue+N;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202D606A339
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A202D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiRIue+N
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4322d310e7so405501066b.0
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797663; x=1796402463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+7zW6UhfI3gqV3DdfYb2mC8T84sI8f66dxP7719aj8=;
        b=qiRIue+NCm0v1OfuTPA8S2E5F21T7NjckQvwNi7LKQdNwsDhh8ZOiIzc43fRYJFxth
         bIr4FdgQi0Zqn27J8daeDBOTcLHqMGOxsDMj/O/lAVYOOeUt2V9CJgwai6oYq16XGP2r
         1lM11bZe+QWfB+U99dr94k8jjIs+P2BvIqvglbBub9D50dSS3k/ZZFsCihi0I7rSmClE
         0WV2Din1edTbosV3sPff5HeoLEB8KROnOGk9L/R4dn4u5d3K/9lQvQVoH+suKFN48IR+
         kA8KaPZqIP4MPl8XwbBGPLjX5nvzwv3Cj4QtwRew4eD66Wy3i1gSiHJEOzsGPrxTA34v
         rbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797663; x=1796402463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+7zW6UhfI3gqV3DdfYb2mC8T84sI8f66dxP7719aj8=;
        b=WXmW1qzF0jGbHq4A/m+1A613Bj9MCwghej3NhLJOS+5gneKPE0tXSBLCT9T9Fj3J7Z
         mJxPH5hy+Y3DA6NUfr0J+/bDy+yuCY9XaBSCnAuzBUe9STOK7Si69WiT/EmkUwuOyyZh
         +EjSADjmRD8ES7ntY5CBzYYyckQr5dcAYk7aJElWMUExE91SH30API9uetiEKdjf2l3k
         XRYK4aEGMgHaU+N731/BybM3vhkEnLWF2zx1RgLpOIudGkHGsmR0zbpQeHcjsHU40sjL
         m3rfgdvRi9K5VM7fGFNwQjRkoAkS4blVKrxx5SkVnGx1/Hv4BIZn+zoCm7kBiffU4m1q
         PfRA==
X-Forwarded-Encrypted: i=1; AL+hErFf+ZdRHLtxJHfGLS3Ewjd2GE9h/XJRtEPvc2qbOcUydTQFGehlb6kv9BhxjUFdX12874M=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Keh3rqO3Vm/vF4YUvIBosX2tVP5eT6nL1pjm78DENnaOPh4Qh
	t5B86T2ICQaRAfwuCe8mxuTRSsidnpuCZK+aTFL4Owvg5Dqidpz/Ptgd4ALVOg==
X-Gm-Gg: AZFdTZc7nDXTx77KM3s7vEBk6pRCv9R9w+d9OqmL6IBWbKMcWcGlb00F2P12gizOj5r
	hrvq5k4GLJeI6F+/OhBUl/XKBw+APCyQxFfEomljVpYpoVCx9JLKbtmVvx73jJ/3lVoWhvdUfqe
	dzb8t+6X2wsYSOTEDMlzwmKwvMvcycFgDij2Xbu8t3bH08iU+FiLPyGwUqIE2AKlz75pIsswLDi
	V6VWq8wtZjS7y9hItBKhL8GqGLLZg2cD7QbuyfFLDB/P8a8mQHC+lEhcxbsoQDm2YLoJIgP9TNj
	IrN5Oq2kRZtubxKepKFQuS5+RqQaHwg4kf794VBDLqXsbEFwlmwzivygAfHC8zd++V0vK0IdO7q
	Rg4ap0fRTMbl/Ef9LAwkNXXe5wZVg4QrQB9252V386v3qnzqPzqUq7/m4ceey0aPWjpY4c9B+qM
	1pET0dyQfI85zX/uCkvYUpbItbt5c5lyyZDLdj2D1ymnY+jU8nJazTMjsqQyweIprNiu6LItrFb
	IMYbZLUNVfdFuIQvvXiIVpnwZNakpOEfm1PzObLGOnj//MPdf0Aggo1YTspglLR1ImjAh9REMR3
	QAittVnVGi/wXMwHZSkC9GbiD7Q3P/i8FpouiNtCqvsT4ukO+vl0y0b7lK1M7X+EQhzwywob+2t
	wBl56fnxpGqhFUn0g2TGA3qJCaio6ivc=
X-Received: by 2002:a17:906:d263:b0:c2e:4fa2:f3f7 with SMTP id a640c23a62f3a-c513aacbdc7mr1986868866b.22.1795797662955;
        Fri, 27 Nov 2026 08:41:02 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/6] mfd: max8907: for Lee
Date: Fri, 27 Nov 2026 18:40:38 +0200
Message-ID: <20261127164044.285910-1-clamor95@gmail.com>
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

These are all MFD related patches collected from my MAX8907 related
patchsets.

Svyatoslav Ryhel (6):
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler
  mfd: max8907: Add ADC client support
  mfd: max8907: Add ADC cell

 drivers/mfd/max8907.c                 | 243 +++++++++++++++-----------
 drivers/regulator/max8907-regulator.c |   8 +-
 include/linux/mfd/max8907.h           |  57 +++++-
 3 files changed, 193 insertions(+), 115 deletions(-)

-- 
2.53.0

