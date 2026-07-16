Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07813CD8B8
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190941; cv=none; b=OanyVhpmhOoCvfyVxQyvincBI7KiDX5rpe9pbOLv57t7MeBsZzna95YsdpQnLg/GEvi95CWttYtEJ7umkiXk255Szw0mwgapgNTAqfniyFm01TxTjo6J22FIl1QPLELTQ6aunh0SE7nnLOkdaMDf1bzvjQkPaG2xq5ahga2+iVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190941; c=relaxed/simple;
	bh=ES+S4L0q3Y+siuX7sJHS+NkfNvRFeWV3XRzgl2yzM64=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnoaCNeVrKDaefgFNEqO2RZaFVWZQjHTOBk7WYgFBETXxC6iMHbI9k/LcG0CqUVqdPgGpj7mOAeIYJeFkTa4Fi9Vmke5ylIepQd+tMW2nHvySxky2aFzrIdtmRzy9SFCDkp111sCcFyAyv/aLWYa/1mSPUQm8IxJ9kPo9R2/mQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgzRHVTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgzRHVTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A428B1F00A3F
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784190939;
	bh=ES+S4L0q3Y+siuX7sJHS+NkfNvRFeWV3XRzgl2yzM64=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DgzRHVTtqbJEZTsIRBKgr75pyIXTEFQXY1hZA3t9Y9Z7KAbzOBhViWkIC4Gm00Pzb
	 Z1LqHJI1eDmCb/Nh9yht+zka2Xqui8Oge0z866pGg2vY2AtBwjoxSPxOad4I1nMWgZ
	 9hz7rSDxVoskq/1xmrpqIkNN/CUiQntfehveiNP99vwJc93LqBtWOuYZh5yLGpwIaq
	 emuDV7sdLWgf6CMVa/vma+yH3RXuy+fxEklMmiHb/BvheNRRGOqnh8BNwWWKXKEJ65
	 wC/9Klplb6S25tCQbcTOEXZDTaQ7d0dbhBa+wE3+DOmWbgaVqwJ9eifYpZ+BzMSbaC
	 JKZwiKz2DhXDg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c9107baa7so66242991fa.3
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 01:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6l+D+jivMVpJYrqAV2jDQMi+762me/o/nnHB/K7lA5U0IkERS4250m0iQRIvXa1YJePc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlAEkf9T1o5EnyMJUIGFcSudM9MUGgsZ8WPH4crwUeZ4kc78JX
	XBrQEIXkM7KWUFL/sjtD79/zZJIlkKZRDwJlNydrEr0s1jqCiVCT+rVjdsX3e/GXiba4jVWRLiI
	DWDQVXniAZLsEKtInkcXWvjDno0+PXTuWoByalybg4A==
X-Received: by 2002:a2e:be8f:0:b0:39d:b5b9:f0ff with SMTP id
 38308e7fff4ca-39db6bb6646mr12898421fa.9.1784190938382; Thu, 16 Jul 2026
 01:35:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:35:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:35:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 16 Jul 2026 01:35:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=MefmKSq11Ro39bo0mTmxS8Y0SEy=D-VoCPXw_1EvtBDdg@mail.gmail.com>
X-Gm-Features: AUfX_mzzUnu6luY_O35STJfNOdQkPH3rmBGMboWmpu-6xPhUMPNEgRGfb2D7GNc
Message-ID: <CAMRc=MefmKSq11Ro39bo0mTmxS8Y0SEy=D-VoCPXw_1EvtBDdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> No more users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> As of today must go via MFD tree where last user of this API was
> converted by the commit 62acd2babc1d ("mfd: si476x: Modernize GPIO handling")
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
