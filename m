Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463536;
	b=mpDzzsBErtTQZayc/PMg5awc0K4N5e8HIfrzYbGnhhvYykOMcVbrCE94UIlRAXMfgAcJ
	 p5wanXqfmwkejtHvBV3JlINiFP+ZdHxKZVSlzws2eAG4H2DAJf9JNIngmV7SwopHkQMWt
	 teXUdJ8KfgaeNzUrjdj9LpDWLGTxcK4zXLX/7YYgjFsGzAj4mxAevjeNN/AycQL7KLiT3
	 1opO47q7gX+pzzmpax31o5xEmGHClUh0dgliffTetJ2N4C+PJ4oIdp+APPXeDRrzIoFTa
	 gEbY53k4VWus1YgxcKg1Q0tZSqVScea414ucA5LfE4iaf139lpkd5f5L0fzImkqYLlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
	b=I+eqZ4owowcgDb8t0U5vSf1FxunG/Ip/6suw6EHKXIf2n7v7YeGB72K3+/HFBt4LTKDy
	 jGOiOka8UNdg4LaXPKGeJ6B2VcaU/pM1k9xKzjCZ1KRPlVo1AxFWEeHe4/VsRx6ga2Hvc
	 AL4IPfqcaOfOjMJ5cYlZZx+VNWIOHmqnaK47mKNRoTvzZoDcACu8JdjsqdJQoLsFPRvjo
	 IBWQZ7JaSknAzbjXSm2AiILkxwTrxNcPbvHlO8B6jIzMKcXhV8s3c34JmKzZVmuMtANKJ
	 s1FATtk40+AvnFy4hnF26H9T2ZQ/hbTQwnMyKqhtLRK6fiqxysJtgSMzI7BdVKnxqsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjyLydcX;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50741606A689
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 19:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50741606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjyLydcX
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so2847617c88.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463535; x=1796068335; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
        b=fjyLydcXJY1NEu4XWezj2b6XJQ4UgNl3HxX7rRayh6zRpuyN9TBJKBRy2KCVSz8JcU
         Va0k3tEO2cNH0594zJ8hY0UQHUtOausvhbK7t+pFRIJvLmQP7GZUMeWTb1UsJRL/zSft
         5aAvgZ/JzSgafe+mK9T8ekdYw9o6EIZwrgmQM3awZUjlEOPcu9aHdH3v8bVhi/Tm5aTW
         5a+E0zO0+WKD4P6vi9Ap77wY3t5i5vikC7xz6lGLHIRYmAdXfYm1xPDIq//tptn8Dpnf
         vp/cD+gH92k6Zb5yRqBPxXILfzjoG+ad/+e+MTtbb+5RpSDMPTokGGWXaUiXjT4INeUD
         h0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463535; x=1796068335;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
        b=ahbaO/PSWwnLRlWsYq05n/q3JvN5XRrKFixdljZJ1hiiNBaRXYEoV3WJRBgd5MadyY
         XjoRhN+AKFXki0y77npDKv4N151bboKh8ekb99+WOQLOE7tT6ZyjwOykQVCq1Ap9/0/K
         gdrRrR3L0XUxupqGHYaIcnTSQOfqRDQo4R6vUSE65+4Kd21/e6AmhRVtTb8fmLm1yWWs
         DRChW1j0+1wozeuLOit2BbN5ax81coSQUgGH7mevTBUDLh1RJbx+xtioMMnM7RIjNiOZ
         cZqWw/sMr/DkfjuN7RUyZQFRs2am15UmZ7JrjQWtPkHbCDB+L1FG4rXLqVDpETd5R9A8
         rusg==
X-Forwarded-Encrypted: i=1; AL+hErGmShF2Iu/aQHhWpOsdlAIJdbACpoEqdm1lVbRiTYy3Htkef/zdlhClKABsD5fg9d5RHcE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+In7zEruwO/3IB0IUbE9Zwr9fq2LXZQtA4Gek78p4rpHBJwqo+
	UiDuVzgsr6/oSu8jT5QQ6Nlqn1HCqOSzq9B+Q04MsAYFx3Ukd0xt1mL7
X-Gm-Gg: AZFdTZcOFTxD2uBgHdgKDG4BSg9fWxC9+mk+AqNg6RrjGA8j6o09Im+DODZwPYqvDwm
	CWWrklkSbmEWvGSKyJa74fySecLx6GqFJdpr4uSeDJ/OBmlBkoDgYDUkYY8oluhzNXbN+cWQUCh
	SntB+4dQLLLt4YvlnKFjrJL/U8vdZMgQG/RIUV5mvjjh4Ft3yweo8944S2igext94TUfGOw2/OP
	EHYwM6B/ns/dMwEmoqIOpFMO4gcXm6VYll/tx5grKtlCYQ+SO3JwbOO9yHNti6MZUfyCcZSMGub
	Wqp3g1SQk+/Y/wfe0+enZtddTSVmD1w/zPCMCqH9Ha3xR8HcDPorNcfWnwP3Lj+4lf3KfObdgoE
	oTcGLFUKGzSXgApyThcizp98O0+XbsEg62aUHRdzNG3nC/psKFQPAOdlJ/XLiyRwo46bZlHUGDJ
	P2/Y0ah46L71aWugoDhAqhZ7zsxQh8B/1QRCcOswRStKUBp54BQVsRJibRCW4g6guHUyZgoxYt1
	+8gjDjV6qmO8neoGlc3UJgJgo0/9Qzdo2hzw0JtHgp+E0kOiVBQ/yN5b2CGRtgswi8lIKN6kQG+
	qHo7+v3K6nTFiEHkkINDkEb11EvtAAKNot0UuI3fWpy8k85ijdSb037ilQM1if92XN8nHIxuT23
	7JCiWDpBqzNUeQo8=
X-Received: by 2002:a05:7022:5f08:b0:144:c112:5f24 with SMTP id a92af1059eb24-1b5568f9e24mr12609285c88.25.1795463535268;
        Mon, 23 Nov 2026 11:52:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm34957036c88.7.2026.11.23.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:14 -0800 (PST)
Date: Mon, 23 Nov 2026 11:52:13 -0800
Message-ID: <dfdf0c3f2c02672514077465784ae1e6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lee Jones <lee@kernel.org>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 2/4] ASoC: arizona: always parse device properties regardless of platform data
In-Reply-To: <179414246010.3630016.7821414370886873553.b4-review@b4>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com> <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com> <179414246010.3630016.7821414370886873553.b4-review@b4>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mark,

On Sun, Nov 08, 2026 at 12:54:20PM +0000, Mark Brown wrote:
> > @@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
> >  					   struct arizona *arizona)
> >  {
> >  	struct arizona_pdata *pdata = &arizona->pdata;
> > -	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
> > +	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;
>
> This changes the default from ARIZONA_ACCDET_MODE_MIC to
> ARIZONA_ACCDET_MODE_HPL, and might be clearer if written using a normal
> logic statement.

ARIZONA_ACCDET_MODE_MIC (0) is not actually a valid headphone detection
channel: hpdet_channel is only programmed before starting ARIZONA_HP_POLL
to measure headphone impedance on HPL or HPR, and the switch right below
(as well as the DT binding) rejects 0 and falls back to HPL.

Before commit 9e86b2ad4c11 ("extcon: arizona: Add support for select
accessory detect mode when headphone detection"), ARIZONA_ACCDET_MODE_HPL
was hardcoded for all boards; that commit only initialized the default in
the OF path, leaving platform-data boards that omit hpdet_channel (such
as crag6410) with 0 by accident.

Fair point on the ternary though. I will rewrite this in v2 using a plain
if check (only validating "wlf,hpdet-channel" when the property is
present, and defaulting unset pdata->hpdet_channel to
ARIZONA_ACCDET_MODE_HPL in arizona_jack_codec_dev_probe(), matching
pdata->micd_timeout) and note the default behavior in the commit message.

Thanks.

-- 
Dmitry
