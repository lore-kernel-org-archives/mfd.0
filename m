Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793871768;
	b=E/MYtXkfubqTL6r5zSGpOZ9aDWulmRbcbR+bTcPqeP1WESGt7BPowRoaJKQnboxmc8Ck
	 95gQ5NYczZltbByrQv8q/kGPv8tHoAgRdKcn4t4+ppXRpshPdDyilaT5L3ckBJVecjVSz
	 /wyrhvbEH74urey+6qBEYHxR1ymD+0tge7YdVZ0FpB30rcz2s8vVKh5nhWhtLAMEKvZ1Y
	 cjIab/7VlckSnkM383BIktAuy3XLeFSW1JDajA1rNftAkwZrGXHNmw7wfNqbXoVCtQW9h
	 yCq2g2T3556YOBGZN9nGF3rTQftLSxHz5NGSH3YElJBoqqJMDNqn+hW+Q+0aXCTtXbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
	b=bQw+6yxLJ6EbSUAKSzGyLwVaRAdETsC0KyYLzvzA/3xDpecjILPJfi8Y5nKLOxKY1azL
	 /HR3PGXlXc+qFUZNPe6mgr2IS735DzjBmNUau03yZzPcW3tomJTvBuqdoccXUcIbW0ApN
	 96gyp/IQ5cm0bomGNQN3OpDKNYaNXY5Odv927JHch/hjSQIkX5P5u1F8SXILVz1OR8PIn
	 50aLlnydAGg9khpr5x0gY/h6Po4NHoYtJtvTKk8yRCRmRwbeqHcFg1beXBF7EbvUr59Rv
	 Ftjhn4ACZa3L3NlVcWmuSTJifiVHRu2STKpk6eQ0X+QFHSJfv+Fd0snCRdVu9GwI+Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izcP2dt6;
	arc=fail smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267EB606A326
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 09:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izcP2dt6
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2757982a12.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793871766; cv=none;
        d=google.com; s=arc-20260327;
        b=Noql49zBgrptv8w6+wJMeTM6V0EH0KKpYS0FytlpZVveXMLVwc1Xy/uSOL9XrD+DOg
         1W2+muOIDlemXaIqVvE1QP7agvsc/X86sURglLzCTkMN7RhrEcslYM451e7JN2oIvUoI
         CyPGU2xJjRFMMBHdn0domk5uRM7l+P004u5rIcQbwh1QtDdnvuhr09ea3R3oRce3CZ+p
         HrZ3+LnfqTDHUZn+JhIAObytG8sledyokWP6bO2ayom+6RQsCCUDy68BVPkh34//6su1
         /79pcv32QqmUUAgPFntcRoN5UsD6DncdkP9BOZg8LX8zLz3fJ6VR0tFBXfrIp4TA6hX4
         UWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        fh=gC5Bx92wx27hs+dSp4djekYzVr2IJ26GrugOhWxyCdE=;
        b=hZjBaqjJz/PpS2uIo6JUnqRmjsZ9+yR2dBUbRCuEjMliaEN2vfRYhl733vXOrJy13F
         XG+4vKJDFP4pMnIogIRWYzOdVnqV2UnI0JeQFSWngtmJAcBXIti3OfEgqFFwxhjJZzb7
         MB4Fp/7Ysf6Pz7+FAazXKpVv5XtGy71czEx2rtjSQI37PVr/V3jgykI8Vh/1e3LW5BkU
         7yHEmmK1Lt5yeNtwAFYOPDXEoJil/9sQbnbyRSSHbsAX1ZqJOH2aKWAadlK8FT+WvYMK
         OHhkuYH2VncErH2O4hGRqzw9CDL8q1SshnXM9kBnQ/iZ4Bqd96EojGmRKzvrt72GUHI3
         7hXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871766; x=1794476566; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=izcP2dt6SIfwnwo1jFk3yhcktj2+ToIBBlu1ORAs2pdlHwkHcY1TXkv1X1eqiTOU9h
         PNWrrVpAHzjil9qvbULirSOC3rYbcliZFNsojOHmy5fNBBDKYhe/tuz1v90bGxaMYCWs
         VU5vbYdLHf87Q+ayoV28d8Ipn5GTfqY9Xj+vqg4SjU+faYKTLJVzndvFa43xB6DIi775
         KTjPDR9DEhvJ+ADxdM55DUMBWQL10JrzMSp5x+kq6TAq0z0I0t1DkFdTaJpKhBrsglIU
         nsT/+Vhj8ILBc5qFdfGo3CWIRDk4n9PU7VbFaioV8YBUgagwK/YeoSvYy3+57cjnx0ex
         bgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871766; x=1794476566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=a3C49DVKiUUcaPATh1SvCW/+4D4IQp4O2lbtmzBwcIzRi+R3tYw6RDeKZ/F5tFJjPB
         TUyaq+QP0N9ft+HYeyT07rBlfvIWP828yQDjcUhjj2jW0eZoNUSRDfB3llw6oxFwhRPK
         Xz3Wgfv8EnCURqf+dX9IaOhP2GY10AFi58WoTrg/g7eJoTxhbmJ47dRDkTvx0+B9bIKh
         dwm9SsT62nPuFgCFAWEZ1RbMDYFOp5JXhZ5BTms96qh2GGzy7j7Wk4jr5y10s721fQg5
         WPo8PLvnKDBomnGNAIXp+nWvjn/GPoGox3PLGKmwa4RgnN6jXsSzCYxMBJnvTB+XhcLd
         Gplw==
X-Forwarded-Encrypted: i=1; AKwUvBzrDNG/cgdovPyWQC131TAvkdEOv9uhWzAag8ckoqZc0iHbuCKWt5cAV7doWOvCMJpWzdg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9B1gewQxzfgixmSBDHjDREzuoGhimDlOmVg46zByqGBmANp2L3
	S0rYNJ3+KyZY0W0OPDMwImsynOUBZHbFD439eZkw4+M7Lui13WYIs+WRL1xp07D70Tpdj1JKnT6
	Yh5pKr3dvo2W4BE847ei5ncAK7KeWuBg=
X-Gm-Gg: AYBFou2NadfWMiiRb+zrT3AIY0bCHCWxDm53qWbfS6x8taukOyGEIcXnDsKSICCxkLl
	1kK0WUn3P2OnWjNYv/EJw851nej+L+TaKV+OQB1JkV/V5/D+6Nd15A7EdqxgO+IIH9NamwqeusS
	IyyXRwFi9LCmPsI8L+eo7js/aBA5J6XraSNUZidbLdG81MopAdAIpA41DlnLtMsUf8ZLdYnl1jE
	uUarxHKSyqAIxO1DGF/TSaD3lnPOBPLvaFWPF6TgDlt9aTR5M7PHn8zgvM05APtbMavbo3mrqpc
	7VbY10ykHPuAxHeNiErM3OR//lM6zbhf7Djb9SXTvsFmTzVGVplq8T23yiFn/+eKwsOHruYtriD
	pxghkRpNG/dA9OKOz8O7EpsWBLocfcsvQxYQ=
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id
 4fb4d7f45d1cf-6b4d3377817mr10254827a12.2.1793871766289; Thu, 05 Nov 2026
 01:42:46 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261021105109.199886-5-l.scorcia@gmail.com>
 <179310028255.2808517.13933580516140278450@kernel.org>
In-Reply-To: <179310028255.2808517.13933580516140278450@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 5 Nov 2026 10:42:35 +0100
X-Gm-Features: AclHuK8keS0URREeVHi2bDcMrIMTrg9GDE11ruNkJWdKZdjkdmjRgehGKxzojT4
Message-ID: <CAORyz2Lv9fBrKZOQ7kFBE+u-nJ-dFpRm_3G0JTS=bHtEL6n_GQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
>
> Nit: This is non-blocking, but if you have to respin, please use the
> 100-char limit to keep these on single lines where possible. Same for
> all the others below.

Ack. I will rebase this patch over current 7.4-rc1, adjust the line
width and send it independently of the addition of mt6392.
Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
