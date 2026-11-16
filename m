Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869477;
	b=G83HSD+iyk5sDiG1Yxq7BoX8P3T3IyXwMBH4VX95AOrIeMED/vPZTeijLW9PHooP0oqA
	 7y2bUOyy/e91R7Q1CMpAClX6NJ1RZ3rjPf8Sw32o0Mi/typ/yd9mfiH05OlB0YkX4hPXV
	 XHQ3L8rRr64CBQLI2EGqXx3OmMd9qYVy60R1x3E6rRPVv6miBDJw4Gcvh24YvK+J+u4La
	 hhUvKU8UfBfkFSwJalil+xFDKGNlpsFcsXVW6tFs2mjQnJpn6fYemGXpD1IY0ju6BP/ig
	 FGejKZRjYCGDHbgeePdlddLqVIISnCdbOOzgZ1Zs3cFg23r9HK54vxVdLWJqh21dVNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
	b=30zWLmHP45mM7FLdDFBYqFG+ZFjvWqI9Y7MxMPlk67u5KiQfaO+u9TPDjQnp4UkfSLmz
	 8IoiQ//qBGOLoxlAlxrFX0j6/W1ceGU041+nDtyiSH/ycxO+WS+wCMCXBB7aYYg0YkzJT
	 KAuCJJ18I+mdm4NrvEyRz7EfopgOLpo7+KvUGEAKipVEAl+V4HClnzZHqcKUwx3tLCymO
	 ukBxkoUuogF/SrIC5Q3FUEtaY+uIKSeej3J9sMhtgHISY4D3qHSlBfTY8hEsaYU2+jN+1
	 yi27zznLux8QBXi6vLyHv12tjS8U7kZ++yYkNy0ZmD/OZlz2qUJ64epEr9tMIPDfCgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/PqAoE1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC26606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC26606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/PqAoE1
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f7768acso3278181e87.3
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 14:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794869475; cv=none;
        d=google.com; s=arc-20260327;
        b=U7mGdfZDpx6cyzdLoOut01HgmNfhFppB9pOR9vmHOPuT2kSXe9FhPIe7VHH1X5RxZI
         gBDU94XgT4EOetS5PtHigh8h+C2cflw/2o3A8dXLBigW4erTHJbDzstHDyBwwtBQ0SIO
         EG1mBHgGyKWufb9x9Ynu5YkzSvHoKqOmMuGWRdIduV1ilfGN/rFlVBi1PVU2+IzUo7h8
         90pKvSlKPEuDe+YvvSg7drxqzeURu1A1h+tmaZOB8sIW8k5DQibfWEE3DrycPoHEXcA9
         k2ULqYBBu9Ea3hZeEWK2WNUC9MvntrTpOo7TcT6r7ivVXuZWoeluCYTNGnRBy3aXc2Bg
         ln9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        fh=RYo+xkoVtnYrLtrGF/2KRuEbKZSxYTQ7BJFNTl43PLI=;
        b=YZjJgioqdmaAxgtv3WTX2ACEhisKOJWN77PO9b+cXPknxgifF1i86nDbFNvSiYLaRX
         4DARv1V+WZsxx2VeWr07Bot8WaFhXPnzALXmDpLgnrbT/hg35TXIrW6uWeSzDxB9ykvq
         xp+eaabIDY5j1gELnRq30Jmc1a681d7i1A9CGzz5jBYzZ3g70qK5RiDq/+Y4D9P4BpIE
         1Q1b3ou8htdgKs5YvsRv4p+9ZM/WBmgw9QXMreHSaGoyw0fhMXVJ2ywVGW+GIjhnZR2A
         wN+k17aHfvXMihrZc7AlBa4qIlqAA0iDFbCyji/8kJi/+mELr+mGfUZFUDM92auk2tm1
         ZavQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869475; x=1795474275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        b=i/PqAoE1/kPFQN1tJPckyQIp4inbHV2tEgQNzwJ/ioys7X3t/V+H8N39AKd7+rxKRd
         U/L1Dzala5xDas6SqUvgURX8cPnTFaP9kWiNuNO+9NYfPPYyoff8485xWSW79d/1YOsG
         Xg8e+tnSxcDvOkDnj0nRro4lvuTrO+lSg5609ovQjsfqo28AO15EIkqnNWvUF2SjrwCm
         dGvVkoLk/9lTQF5oJZfzqr1JSjW0O5BW8RbS/Jcmb4oAMEtkepzWqB9QVvdmq9qkTEmE
         4m/0zrj/N/xXgZ/J8B9SnGtuP2sY1HK6iTNa4sjDtpQCiH6UjZwd92H/BB0sPbCzLEoE
         ajcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869475; x=1795474275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        b=lvkZj/cEX0k9PAJvsgDAmJqdJmjEEQX8NqCguVitgKyiNQL2/hDjiXEDLrUydoQ0Ok
         9qiPTO89BgcAXA0tfXP2MMudyqZ4ePf3h6zRBtDJKasq3yNjsRp22Lw8BrvUHHzlwuSm
         ggnxpESCdt4O3MD6aO1zLGdcy2/c1U29srlIwLIfhJI1UvkaQJf5nOPAyrJglkviY2lO
         evAoVQXF83XiL8LErVOcNog+6frjkGReZiX8sBlULJ/3fzgTuqPJMfZqQtQp8xja5iuD
         N/3NfToEDXZjmnMaNg9ekAKIkGPiRYzVI55106ug5JayQTl5EsMEomQoUIYIFfkgxZj5
         u+DQ==
X-Forwarded-Encrypted: i=1; AL+hErGEXbkbARTSEu3NLXUQSSCHrNHCTuxM+gbc7WDwVynVtpU8aQAqCZmOmLPRjISvfP61mrI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+9e/6jhr+QelZ8Z9weIm1zK5/Ei+fDhoNiFcpLEqfS42r0ik65
	6Gr3Wgq2uICjn2gKD05/6bOab8jgyad6xhyeMsqB4Dl9SSgP1RvuO1KcLzP/H1rZTsYSP7viCVG
	JA6+AfaaV+ky67YdQ/jZjTox22XTPeu0=
X-Gm-Gg: AYBFou0xgrIO/WoFUtshIuSQ2fwxq/0c5LJVP2J0Bgdws8rIp6vH4E2kq4sslDQJgtr
	BkH9yeWX8eKV1Lq+Ua6eRgtlQmPeJ+ywuAZyYsjZroegU0HA/2LFcUYGfO2udFkufNOuzAXuFgv
	56d1rKWihBdnDoR62HD2OJRw34ejq8W10P6cMNLo0hpUycZ7gDCYWUsAwSxLtEYT+CQkwMzRU6z
	MTqlyGIWDbt+G7iknKaojUN7d7IeEkDzCUNiUvoxp82rLmxvjgkmqM36Dq2ToFM0B7NbHXFanzn
	5Oo7PmgJsXH5GJLvRfJ3G3xBjG25ZMvbdAjXV8+usFi17YWlyLGjhtA+SnnZFlrLegJEwqhep6c
	QOEPBEJBWMTzWrJju7LvBd+jHYAxe9r0GV2OUo7QfKynxuQ0O0JYMPFReF76fuBUmuooevDq4o4
	o+z3qv7qsaNukyoo42vC1x+BbTfg==
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id
 2adb3069b0e04-5c1709c5b64mr4475988e87.39.1794869474886; Mon, 16 Nov 2026
 14:51:14 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116224803.61154-1-festevam@gmail.com> <20261116224803.61154-3-festevam@gmail.com>
In-Reply-To: <20261116224803.61154-3-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Nov 2026 19:51:01 -0300
X-Gm-Features: Aa3M54oXe-IAn7x15degHvby6uCIkABaEwDsnl3MJEDi4r1Iu6Ak5t9VY_ssJ7s
Message-ID: <CAOMZO5CPym+AYFLv7D-mAH+OQXL_83yForV3GaSk4ReT_x1HrQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mfd: mxs-lradc: Pass parent IRQs to child drivers
To: lee@kernel.org
Cc: maz@kernel.org, andy@kernel.org, jic23@kernel.org, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, mfd@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:48=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:


> Changes since v4:
> - Map the LRADC MMIO range once in the parent.
> - Share lradc->base with both children.
> - Remove duplicate child memory resources, preventing the unbind use-afte=
r-free,
> as reported by Sashiko:
> https://sashiko.dev/#/patchset/20261110141934.42490-1-festevam@gmail.com?=
part=3D2

Sorry, the correct URL is:

https://sashiko.dev/#/patchset/20261113013212.470981-1-festevam@gmail.com?p=
art=3D2
