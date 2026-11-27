Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795753621;
	b=ncBTO27+vdOiKhwntBU1JZAJhuegmy/PTTJDb/YI2gyBuTxx4Ren5K7Gb24ca7fncKMA
	 sSO9QRo6m752PgZDT9gMOEdhojo44Tvp2jCWB0dHL37ZWxbSNENm3TxH99TWtNj2oUCsM
	 HBKYVXsJVnwUG8PfoAmx266wzADOV+I1qqfxyNbQ+M73Pv7MfPZRySOf2+ucAEXvHXL8T
	 8/QgGkvY/k7PIK3ovedJ9Ijyuz3oViIXmyRvBsTK9m3mbmJo2GVNlCULgRhPHy39xcW/7
	 JE0jcE8MRdmgSTpbyEIW0FQEJYe4BPzoigqyLqsK/zbTAEmvN3uMOCmz9xSkgs3xRHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3qS0H1QSmdZRvUwPYjH41dWeiKOJaG+GDC15zaeZBeU=;
	b=YC7sBAkgs1GsCla12sZiKErEy1HpbPowcuFjMGgqkuDQE+LCgYHv+75rGmctjxaz5gpv
	 2K4hPOvGbq7gK4gvgMQhB2s8maSmVwNbR2etVBBMMqikC7+8N35NTHepdQtweXp7vcYo3
	 jncSQNjcXfJTRTAvMhlYCQ5JdLJWcAoYK7Nf+LRytHHRXoLGQIxJer8OYM7RpuylGW70j
	 lWmSCU49oz2w14MQGF3ZEl3aFKArikAQYr+2wmQXk5jF26VGEEkI6S+2SsBmm3uf32BTU
	 dQ/Yg4aszUCWxSNinZ9gGf+lYjzYVRuy4Sz8IHwlM1YST3yMoHVVV4424Y/fmXVH69A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yz77t8mA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BC606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 04:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yz77t8mA
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-57e468d51b1so1611207b6e.3
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 20:27:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795753620; cv=none;
        d=google.com; s=arc-20260327;
        b=dltvi0nlT7GR87rUA6cDnRYD+9cE/+vl9n7Zyb7EZdCJuAychpaoksDxO76Ze5LyGg
         RTBLraRAVT4nhALpAMNrqLkvmCKz70mUkyit2tQYSykDh2A/XgJDCzN1Q71lx7LAZD+J
         j7NAIkgRDYk5rsbqJfk4jfTcD97haVbYe5m2Xq3mq2ouyz/AZYcDvqx7iONLymMv5ZSI
         RYLQiZgF8N2gly+hKuopV34pp4YoB5h+FYwUydT6QpHb+SEDnH45mN3pqfpVyBHyleih
         bLmTcp09EhREJidtqiLZxcpkRTxiM8/sXrbEALgYqroOYa9TgdvU41gAHTXeDc/yGDHw
         92TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3qS0H1QSmdZRvUwPYjH41dWeiKOJaG+GDC15zaeZBeU=;
        fh=toEHxxGriqOx6WnTsKC5zjtFQ6GtgCniVOG/XtOh2MY=;
        b=WQ8fXKQkvx3N9E8h7hhYKSlggM3SmnYKVWVEuld3U+tHZ2s+S/vVicouHyKxLDJFLF
         j3+dBAaroVI673UIvb3q2rlr+NVtrrVkAJFdZNX/ahxV97C/6SRlNdaLZqW01jv9+YbQ
         F8epEdDr2k1QC1oyuKOlKzrf7WTFXxqlLRmn1TRAA+qvcu/yfG1oavM6+TO1e+hD6Jsw
         IUmFK8KZkPwzia2HG3t8BuVCWmGWkJCIvAzmzAH4nqCWZYKjni66i8ybNyYtjQVwz28D
         3RHpwenNrDfPtJ4OjjHS6oeOl+t65jOuM3X+9LdbBD2cLmYSuAhdbCLHZN5fxC7iqDUq
         cmxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753620; x=1796358420; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qS0H1QSmdZRvUwPYjH41dWeiKOJaG+GDC15zaeZBeU=;
        b=Yz77t8mAcyrd49FtmqgfzC7QtzIoVPlgB/WykJecawYegjgqMMzxCM8EU5YolLAD3Z
         VzX1lkPHXglqUrB1uNgF0EKv0PKw5e8xeY6K41u1gpmwZRyaxfUrig4/FHq3wIZZImEY
         RV7XeEgjlMYFGY5yY/72ml6oE9vQvfoBMmPPRmN4LJbUjB9CBZLRPCaewIr8+LSlG5wi
         qNspetgw3HbFrnZhnI/pOc/SGmB9guHCdC028gcNC7R6pEhgrvl5pvNrTQmXwx5hhumW
         o3U9J2QFBri+W/v6jdTZ77HZXRWDEpLIEEFeGgrC/F8XmHS/oEmG2WpV+a3OFVGxYJtk
         5KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753620; x=1796358420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qS0H1QSmdZRvUwPYjH41dWeiKOJaG+GDC15zaeZBeU=;
        b=rMZ6r7oL5PycF9XwqzqjzMzY6ZbZGd1JQ16d0zIir3ft5J24BV9+D0mke8lRLhiHe0
         3TYoaz9aSYBLfzd80i9ajZJeaPW06M9p4Wm4+FxdqeaTi3TGHz/g0V980jIM0xIuN8KX
         H0m/PG7j7vUpTZ844cyKd1KqPygGvTUmNDAyKOp6zmFyHoRfBKCU8lSESRSFFkmJZuzq
         lYsg7DYsNwxC5Xnh2/VHoCvMonHgARD1zvsTu3ZvXK9QgDuApwQ8BKxUFdc4DR0RVDU/
         W147vuxhIciHdVkAvepwVQfC4gsT7AkS/NtVC/Hw4WFd0KJi5ucEbcBuce5f3AQxPD87
         S8lg==
X-Gm-Message-State: APuU4Z84tNZNBur4i5Ow1Gmt6y5z1GB/wq+AHPog29eC5w6U1NDqJ/jZ
	l0QrHhEzC6AXy5pmSs1P6NsPcND4tp/Rcv4nbIGrTfmxGp1gtlw1E+3kVg76weLxlPzzZXGiKF+
	azpjMpSuQAblMarEqrdzXmQ9jAXxEGGpYVShcsLA=
X-Gm-Gg: AZFdTZcX5hw0Dxl+qbScAAKX76Gi9BiEi6YG9nhGy6NPNxYpvJUgDXo3ymIMsqjSLcd
	nLwm+yv+6qH4mgTz8ElPfN4bEyOK6UNoqu2dicCSdMELz3LmRJoJjkTaRVfX0vt8Z4tvJfLdk7z
	ESl1VcVbwsqu0AwiuGfaNS5fjJmymidiABaqdrRA/yaRMgDfmH6+vIrXhyLYQavGrsdKcMnbkw8
	HgJ0BgLxJ/c0Vz0fMixemY0I9fbT4sn3csZO7412GC/Z5dJKJxsvOdEI3e6ej0OXZIytVME/fYO
	l04X+BGWbmDqaJCOxiy+X+yYPeDV0+UxdSZMffbX5mSk/l3ot2ODduele5s1d+u/jTv3HQXSUSX
	sJXuJNm7CtoiSjdnFU3SK3nofYLJMFjVnpbX4UPZ0Me+cDiiEHIrvWprKc9z85w4dhBNzcXrTXa
	YF574jY5M2cmbWAoM09aTHTlY+
X-Received: by 2002:a05:6808:308e:b0:4e4:86b1:f7a0 with SMTP id
 5614622812f47-57a0bb73645mr24738261b6e.53.1795753619729; Thu, 26 Nov 2026
 20:26:59 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154950.8673-1-arash.golgol@gmail.com> <CAMxPZkgRDb49AQkEfN391B-37v+y6x8JeZtb65X3T5S3FDuLDw@mail.gmail.com>
In-Reply-To: <CAMxPZkgRDb49AQkEfN391B-37v+y6x8JeZtb65X3T5S3FDuLDw@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 27 Nov 2026 07:56:31 +0330
X-Gm-Features: Aa3M54rjPR6dvlYEZ1rXYV8bso4svzYDuWr-A5wthuyoF6aLf97hsqOvE4XJm3s
Message-ID: <CAMxPZkipwoBiypAxD=qgWpSTmxznqWW8QST85xg1d9TixBTRcg@mail.gmail.com>
Subject: Re: [PATCH] mfd: rk8xx-core: Don't stop RTC during RK809/RK817 probe
To: mfd@lists.linux.dev
Cc: lee@kernel.org, sboyd@kernel.org, tony.xie@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 8:56=E2=80=AFAM arash golgol <arash.golgol@gmail.com=
> wrote:
>
> Hi,
>
> On Sun, Nov 1, 2026 at 7:21=E2=80=AFPM Arash Golgol <arash.golgol@gmail.c=
om> wrote:
> >
> > RK809 and RK817 have an internal RTC that is managed by the rtc-rk808
> > driver. During probe, rk8xx-core stops the RTC by setting RTC_STOP in
> > RK817_RTC_CTRL_REG (via rk817_pre_init_reg), and rtc-rk808 later starts
> > it again in its own probe function.
> >
> > This unnecessary stop/start cycle makes the RTC lose about 1.9 seconds
> > on every boot or reboot, as measured on an ASUS Tinker Edge R. It also
> > leaves the RTC stopped until the next boot if power is lost between
> > rk8xx_probe() and rk808_rtc_probe().
> >
> > Fix this by dropping the RTC_STOP entry from rk817_pre_init_reg.
> >
> > Tested on ASUS Tinker Edge R (RK3399Pro), which uses an RK809 PMIC.
> >
> > Fixes: 586c1b4125b3 ("mfd: rk808: Add RK817 and RK809 support")
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > ---
> >  drivers/mfd/rk8xx-core.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> > index 3dcf6abfda74..887b0adf332a 100644
> > --- a/drivers/mfd/rk8xx-core.c
> > +++ b/drivers/mfd/rk8xx-core.c
> > @@ -203,7 +203,6 @@ static const struct rk808_reg_data rk816_pre_init_r=
eg[] =3D {
> >  };
> >
> >  static const struct rk808_reg_data rk817_pre_init_reg[] =3D {
> > -       {RK817_RTC_CTRL_REG, RTC_STOP, RTC_STOP},
> >         /* Codec specific registers */
> >         { RK817_CODEC_DTOP_VUCTL, MASK_ALL, 0x03 },
> >         { RK817_CODEC_DTOP_VUCTIME, MASK_ALL, 0x00 },
> > --
> > 2.34.1
> >
>
> A short follow-up on the conditions of my test, which I only
> understood after sending this patch.
>
> On my board (RK809 on an RK3399Pro) rk8xx-core is built in, but
> rtc-rk808 was built as a module. The MFD pre-init stops the RTC about
> 0.4 s after boot, and the counter then stays stopped until udev loads
> rtc-rk808 and its probe clears STOP (about 2.2 s in my log, after
> init has already started). That window is what I measured as a loss
> of about 1.9 s per boot; with the line removed the loss is gone.
>
> I have not yet measured this with rtc-rk808 built in. I expect the
> window to be much shorter in that case, but the RTC_STOP write is
> still unnecessary, and with a modular driver (or a deferred probe) it
> makes the RTC lose time on every boot.
>
> If it helps, I can send a v2 with the commit message reworded to
> describe the problem in these terms.

I appreciate your feedback on this patch.

--=20
Regards,
Arash Golgol
