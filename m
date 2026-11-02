Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793597192;
	b=fA8AyWSnE1VwpU/Fp3KxEzXBLpLufo/cr/6tXqjQZJqX2y6ETSLb+shGfzOn2VuaCa0K
	 8jFqj7eMb3sD86CSDFRf53eug6dME/oUYFVT6PYGA1bHCzN5Q7obImQ06LYSWTwJD70Op
	 EKSJzIkl+gRf2ILo7HroL0VuFhK2825qcWjR4LOFbOKqurFDDK6i2Kv/vIjFM0UW3Qlie
	 aDU77BbFWV6r7o5oMLXAe6iMUX+By+D2z0XGdyphJaDzU4f32NI9a//tS60Caig3W5eRO
	 l0ODFLo/yGwGoZ2yhMB7E9TmXW4xsGBuhzCSSNTcu+dl0xlGzTcAStmlXxczPK42vAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VHPoyav5TDPFec7UEQjEwA9eRKsytYFmt41pCHStIx4=;
	b=hS8j657cO5z6Xs98w4jiXevunEiwjXDJIS4Lef2oNe6yVpqBIdWbUtHzef/fiOAGqT+c
	 Mg8nMef+5LyDh70/3gC5LAS+i91VfbMZ95fLHrIvFD6u+JGfMU6ZOimE4qWC8H/YAKF5d
	 f9+8psfJ+HWh/a6bo6LiU829L8n/kV0oFKkUfh7qXW6+WGkAzW/F7ImvjitdA8s7SmQ8Q
	 BZ8rsUNacJEU0yUd70HguJYjLQE+3ITARBCIiOwaNNLmEtrKBMCSs8jEWoFmVOXPHe6Vi
	 fgws0vwTGirTYz/akS+VPgS8GxKWIgoMyb2xWDVzFapHGJqDV4QhpwXZ/uZk7kgs17g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L79y9NFK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB7606A324
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 05:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DB7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L79y9NFK
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1970772b6e.0
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 21:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793597191; cv=none;
        d=google.com; s=arc-20260327;
        b=fCoRxMfhvso1YBcofHyySTzu2ggA2DchULMBHni2A8prnAT5vux33gHSYjkyJkqI3w
         vf2thoM241hZpB8+zF+jV53WW4EiapcwfK2Dagqa5Y4IUC+sPXj2B89ecLnqNp8Au9f8
         GNgDIq8RVesQL3Sux67yuPAZli+2uYb+BF1v8k8Nq9edSPwRyIhKjcHV01QZe49ucrGA
         veKwejGANc8kS37XkRnOPqW0/jKcmLyOjCWJ/+M33kKZL/yfgOkL/p0i07VPz1Jtf9lc
         T81RVsDPWbieTYV8bC5mrLuRDjhiNjQ6/Cway30m3foxcI1pwyHLgce0w7FGFEdzt6t+
         tHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VHPoyav5TDPFec7UEQjEwA9eRKsytYFmt41pCHStIx4=;
        fh=toEHxxGriqOx6WnTsKC5zjtFQ6GtgCniVOG/XtOh2MY=;
        b=FKQ0p+WFr5/2aJxPuXtR1N7tNBnjIJcLqtOd2VMtUUEts4mtrFEariKj0kU1Og4Plb
         QhsFikCntvYPogCTQB2HYEKS7tKebjh7lFwnAO/IdgP8zInm2gqptzZNtQ5UQ8I7RcEf
         IZk6dIHryzl9/Fy6ZFYNrk/7cs0B4tcs2V+b+0qN/b7pCN6D4om5bT1HHYmKYULNRb0M
         F08kPPtsUN/HcAD6kRxoeXihwAVtCbQ7lnLV3y3O16bBg27tQ8VBY4h4SBWr4dv2E28I
         UT/vfcHUEoZItqs9qJPaAGRDitvaMhq46ESp5yQ/XRHa+BrSymdPDSc7ykz3xQ6UCAL8
         wo4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597191; x=1794201991; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VHPoyav5TDPFec7UEQjEwA9eRKsytYFmt41pCHStIx4=;
        b=L79y9NFKp5mIjeCQ0Xz2XT0qEZ5ab+8qxPoP3gx7aRh0gALDgiZwtCAj1gztqX9sOn
         y0cwnlurGA+9o9L3LEB/7DdEVzcC91QdEsSSod6+006hTi91WBSNXJXJHFODw9eVFcS+
         dXr2o3SeTZtbT7H4Fl96o5bjPKpcRHQQDlAbs3SPOb+/8MrE3u9hnUKKIAzJm4Uavw1o
         gAqxCu1gvePl2wlkci72ecZu6lpe3Y3kU4GY37/UYCOkMlKBOBIswgsuCznEbezt7PDf
         zwRyI/TUOvx0F+YjyKEPpgPOFuk54LlOf2mPdgpv2Re8+2uVqAU8VPE9nDR9j9yd/Ten
         MHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597191; x=1794201991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHPoyav5TDPFec7UEQjEwA9eRKsytYFmt41pCHStIx4=;
        b=IEr0miqFFysbVRhtQ6jyXiVVn30uRfgbRht+wt+axiLUzsfamUtcDdXhUfH+susDZs
         HA4m92a4C1KyslEMHlFNB9I55ZR7n0VI1Uh3Sgpb7o8q/ZujMOEsu07s8oskRWYh/yYs
         X3Y9Pj5sNupPOSb6nyJan6KBfZ6f5jFfLfXoWKsZsX5EZsG03J+DgdiveTbm4TcEeQW+
         LoGXAQKAQyPqzljF2JPgvXuk6wg6q4Uz1E4SxVpcjGxxQqWq6RBXAqwAGytVXuuWvGZo
         N705BT+wiemhdCSarpKg/MbS+79yZFfPP8PkgFs3BWwIhxuswPizSozbOvaINYlZcntK
         vuGw==
X-Gm-Message-State: AFq9FYJNLUbAt5ZRxBIuss63Ww47tdxYLKeg+5vc8c2h5+yCkNm4tTg9
	Pe7Rxr/fbm7BrNU+qbI4FkNXwaxl7KI52W5VQv2UnaP/yBEKtHLrX29PotEPlk4oWz2L0wcHoyF
	ZDUGmgPC0ZOyiv0rA9qRCMq/xC/c+OjtWqSSo5WZIr0Sh
X-Gm-Gg: AYBFou0mNSvg0X+Ou7E1w/beqAIvtbz6vliiV4vZTdO3eODWZmV7ofUcBqZzkpuBH87
	VP9nLWNtCPxJSGgiGP4BjZmrRYXjQI6kOi4LIgRSfkO4wMdv9M+PL+o9c5KTtUhy/UGrdc1B+/8
	qPVNi1VK0smisKSPo8SyzT41Cd36SBlWxjjjTRrqz8F5mzsTjKbjDeltYiCeAZ541DBDlgEXl5A
	NPJUdXQarK1xHEEk3gZ2CzBFpRdOf5BiCEvil0Wlq1JJyNNfMZ+6ou7pRk3BWjo7MPRU8kzqFWJ
	K8BL8U7n98C8M+M7d+GIHRJHY3y+7bDmR2mHn31SY7bOry7BNCqk2Gnv4DkqPmcIJtvlGFDpPW1
	X1Rp7EWTY702op5gU+5oKjMPQz95dIYYkR9+MerShyLvw6nrjtDRvQ51/ESwJQvvHLvopEtZ+S6
	LaXqYzaLr93obXAqh+iC8=
X-Received: by 2002:a05:6808:1b26:b0:563:e8b6:c5d5 with SMTP id
 5614622812f47-5640dde7ff7mr5295999b6e.44.1793597191098; Sun, 01 Nov 2026
 21:26:31 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154950.8673-1-arash.golgol@gmail.com>
In-Reply-To: <20261101154950.8673-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 2 Nov 2026 08:56:20 +0330
X-Gm-Features: AclHuK-0kwAg3wvJ5pJjwRSIOjHeCcV_1ybLrei-txtzHKzCBIRqfZ5tJ3N2SGQ
Message-ID: <CAMxPZkgRDb49AQkEfN391B-37v+y6x8JeZtb65X3T5S3FDuLDw@mail.gmail.com>
Subject: Re: [PATCH] mfd: rk8xx-core: Don't stop RTC during RK809/RK817 probe
To: mfd@lists.linux.dev
Cc: lee@kernel.org, sboyd@kernel.org, tony.xie@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 7:21=E2=80=AFPM Arash Golgol <arash.golgol@gmail.com=
> wrote:
>
> RK809 and RK817 have an internal RTC that is managed by the rtc-rk808
> driver. During probe, rk8xx-core stops the RTC by setting RTC_STOP in
> RK817_RTC_CTRL_REG (via rk817_pre_init_reg), and rtc-rk808 later starts
> it again in its own probe function.
>
> This unnecessary stop/start cycle makes the RTC lose about 1.9 seconds
> on every boot or reboot, as measured on an ASUS Tinker Edge R. It also
> leaves the RTC stopped until the next boot if power is lost between
> rk8xx_probe() and rk808_rtc_probe().
>
> Fix this by dropping the RTC_STOP entry from rk817_pre_init_reg.
>
> Tested on ASUS Tinker Edge R (RK3399Pro), which uses an RK809 PMIC.
>
> Fixes: 586c1b4125b3 ("mfd: rk808: Add RK817 and RK809 support")
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> ---
>  drivers/mfd/rk8xx-core.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 3dcf6abfda74..887b0adf332a 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -203,7 +203,6 @@ static const struct rk808_reg_data rk816_pre_init_reg=
[] =3D {
>  };
>
>  static const struct rk808_reg_data rk817_pre_init_reg[] =3D {
> -       {RK817_RTC_CTRL_REG, RTC_STOP, RTC_STOP},
>         /* Codec specific registers */
>         { RK817_CODEC_DTOP_VUCTL, MASK_ALL, 0x03 },
>         { RK817_CODEC_DTOP_VUCTIME, MASK_ALL, 0x00 },
> --
> 2.34.1
>

A short follow-up on the conditions of my test, which I only
understood after sending this patch.

On my board (RK809 on an RK3399Pro) rk8xx-core is built in, but
rtc-rk808 was built as a module. The MFD pre-init stops the RTC about
0.4 s after boot, and the counter then stays stopped until udev loads
rtc-rk808 and its probe clears STOP (about 2.2 s in my log, after
init has already started). That window is what I measured as a loss
of about 1.9 s per boot; with the line removed the loss is gone.

I have not yet measured this with rtc-rk808 built in. I expect the
window to be much shorter in that case, but the RTC_STOP write is
still unnecessary, and with a modular driver (or a deferred probe) it
makes the RTC lose time on every boot.

If it helps, I can send a v2 with the commit message reworded to
describe the problem in these terms.

--=20
Regards,
Arash Golgol
