Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347056;
	b=0h0Q1HZr9R4u76sOdPeW+ZYAk0WpECOjTLtOZ8EbjhkSsxKrITOetbjuqTdnp8DLcYdU
	 NZpBl8fxRjXP13L3hOxCZHLcL4EFx06/Ovoo9yrHo93lKfprzRa3KasMP7hUexGeXXpt2
	 5FQK3YiNS0HmOYwSZfS9bVdf1bNgHkootE6ecdQazORbD2MMvW5wIXkGX4XV94ZPTvs8/
	 0cgC5U6bZLkWYTk+Gns0pqYrQFLdF4mkyJz+Cx3Qgigw3Klc7gqULdpap1QWBPH/KPTNE
	 KP0Gnm6+A/pmnQ7ZsRzWEAsLxmwkU3eRddpqVEE3C7/QiifQowRXT1UC9j1YVWTyLvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
	b=kDYeSyqimBlngfytj3fIEwuRrCBz57cg6Tl93cio8RXoMQ6oaYuf6LyF+B9nlpsLXbUi
	 +obKCMD/2uX9FYgaiPR5QR/9wx95PJO4819QOm5+EBBlrOh/4A7RVRjSVca4j0qqeEEmC
	 REULEEADmiLDqU0W5Mz+vSTFSwGe6l9cPn72oplkXaRU5U3gdj4Wdfq24Rm4k4vXiDzFd
	 6qxBZ1Nl4q0LSgPWT5nIpTQFkdG/x40qUYU1yMMvT/fw+zwrNbEBArrTQvjLProPV3PD3
	 kkUYF7pnYxlety0KBtpeMGmuFeUW7xQNBJ+fTd5mVuuKbAXaxVlSxhHS0QXN9yJIgVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6PGiZgY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED6606A32C
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 11:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CED6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6PGiZgY
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so22512221fa.3
        for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 03:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795347055; cv=none;
        d=google.com; s=arc-20260327;
        b=lP8MCdIR0dJOoyvM9poPLw0kVvu6zCCWJ16Fev1PBeggEsJ3uYo3oQ5wqQxlaYjl9O
         Eeeu0Ae5CYGLstOm3uIWmcP1HTLKqidbuaww8tdpiGFYPjT+lFYXZ5wB7X8PyEPgZ7Qk
         ZNF0nocmWnkbOp3nGAwl/l8iRlEUERmfAS72FfXgQOaUmJC+Hbs29V8Nkri8dWRPsiBe
         LDSiaKbfAZgf/6248LIiNaN29f6YcHl1XFiA2WC+H9L0Fy7HJhQUVJFvcK9iqCgSY7CK
         1Qi+q6RE2VsebwOFSIlSy7wzcQ0Y4EDPFQK2cXcdrY9Myg+D413pAG4LK/wdrcfL+Swh
         cQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        fh=+4rcDTj17ZaRBqda2m0hv2zr09Rxude4cVad223M10A=;
        b=sPBvkzLlm3COlmHRdMPFztuMhIb0fe0xxjGe9+9YOtZiA1KXO6RFVzqZ+7jKfXwJd8
         EyYHyqL5mWZXh3+CdRnbhl9ZGJmpCp1cdtTQSJ2rPZqhbnL9YyQK1jwLvjVsqsNxpfyW
         Uxele2byq548yKKJMn3Hc4Uz8R/fVRyJvQaAwmvOnwJyuuZB4/B4Ch8tP+8qp1C7jDSG
         cajhmuUMOcUKdj/efrYgjD0EyOS9DWH5SXLtsYnCyHtvn1ctZ33L2mrS7d5/GdPAVWIp
         TK3msnL4z0BQpchbXsuzDqcSUmdSYAWzIL7q8hFlRvxjjfqzsiGd6BbRQA1dt/1xmzSc
         vaxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347055; x=1795951855; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        b=F6PGiZgYthx5/wB7iJLTsCSFd7u8ulfHLOzJvl6GJcHgSy9WZw2i5t6U5Go+m26r/c
         V4Cvgnr7KJOW6NawREbMb29yPA4pSn8LJiaCpvJOXR0sfPHK7sstvPsgrjw1ljKPw+YI
         7tlZshRad3BrKkHBaeBsiVsV0vjwe87Yv9Jf157mXdKBSUdq8MPphb+zVqwlWalV3v3V
         oyjoA+YHbk2eSl3G/WVOSHUUm5Bd2QR20aVEEdxKV9hX7DQgC8BSC80c8hY7Fypu7ReP
         3Mexf34oVw4Yy2AaYSaYvELDu/QWRaRg3QE8seuin7+XNE41mHKAm5L7XikTfTfMJ+4y
         1bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347055; x=1795951855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        b=14PfbM80n8mNpq6bd2agwGpWX8mtS5/Oomjg93227HZvJT1NXrbz9nBMis/nrtL2X3
         ETc7yiUVf/13lySoSAtf/jr1XmFeEWzspkT9GNmEaQS/lvjqpXCpvntUi6lpYVmGw4Fv
         qn8Rw1zxlCQMYsPs577XIlH8D7UP8o3CxnphoyecwSv8+t4/g6acteET+WVeFrnfGjRi
         srFr6cIVdLVt7zZ0ikTGsFiDRuxVMWytFYC0LQgN7F+D5fAdoG6UZRuAa1IUo51YDhbo
         LVui+uDAZEOz3SGlXPR9bnx9HkP5xUtyCJ1WomFHinWdac30PCF6e9JxH2oSHQQxFPCy
         ljcA==
X-Forwarded-Encrypted: i=1; AL+hErFK9rEmUL+sdt1BRkaBCiHrR2CUK8mXG6Ca1m3I4phIxOBW92dbM+1JFkYaJ3KrarnIBJk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/8CpwPNXG89yP5UkStIHGfAHNgRlZ7zDcj/gpFEoxqqogGeIVf
	iIT7TZmUmWaQPpCULyv0HLrQAsT//tRocswSZoGZAFYdTd7+qr+2hz83xO1N8QFf6WQA5KkYvhw
	KzWVI3z+yybD1TTmqZt9xcRtbuCQGMXM=
X-Gm-Gg: AZFdTZcOsdLk8UNzYHFxBbLr7a0q/UzwDducCXObtrq1fo0PSYATDnh5K7SB42x/LnY
	p3LI3JmqDYWWVjBRi515yhbWb4lZyXtRCy1Ag7VX90Q6i85C1yTQt6G/J7h7LbmfYmZzmqUXUZi
	/WYE34OqXEP7f38VdgU4mMO7hCj+QWh/hBQsF85hq0/CQowkfzT3jhlFqYqBUTzlu4MmRoAG5Tk
	TojVx0DKvtbGgtbU2so+g9EAZFwsqeldpArvWNx2SB/ehjumohekNXwrpPZvyorogWiGfD/urQ/
	Wvl+36o/t584Q1zELswyulWx/cU2WXJPf1CvVg3kEJJnFPxAN6WubZ1ENu8MzmpQJPhAHDh+WZe
	/OCKHnVeytrRdKP+bim0fG7wn/XSm9rz6r4SE6sidWOxmYzM7WAd9EIIbxTvXynjTbW1fa7XYi0
	JzvXbUivtNykhL2rVGJXz0el02LJUb7C1gqWCf87GRq1kfghM=
X-Received: by 2002:a05:651c:a32f:b0:3ad:fb2d:a757 with SMTP id
 38308e7fff4ca-3ae7fa45871mr24883491fa.24.1795347054437; Sun, 22 Nov 2026
 03:30:54 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119134041.16611-1-festevam@gmail.com> <20261121231726.71aa1aba@jic23-hlaptop>
In-Reply-To: <20261121231726.71aa1aba@jic23-hlaptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Nov 2026 08:30:41 -0300
X-Gm-Features: Aa3M54qp-5FUOe8r1ZuLPebMgOZXGH2Yo_N6UQqWLwX2mQ0uaPQ4PbhpovaTi3g
Message-ID: <CAOMZO5Dp6KYkd6=hsK366x_83ji9tdumq9k5tWXJGvW0EeRpDg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
To: Jonathan Cameron <jic23@kernel.org>
Cc: lee@kernel.org, maz@kernel.org, andy@kernel.org, dmitry.torokhov@gmail.com, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-iio@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, crofts@kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, Nov 21, 2026 at 8:17=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:

> This bit belongs below the --- with the change log.
> I'll fix up if you don't have to do a v6 for other reasons.

Please fix it up. For now, I don't plan to do a v6.

Thanks
