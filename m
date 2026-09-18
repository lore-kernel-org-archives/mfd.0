Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B944A0159
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720686; cv=none; b=PzaZNuZfFRkYt4NHHr2jv+MZNvvWiCZHOc96cB7usMeeVO7wEwZ00vgLgUbIGqp1/NvlLmIubNQrwqAtouyA8H17jc5eE3ugMUxk43Febo3lgcN+KDCt+gvdbTtiObVZ5s2Y+/xf0lqhZGEwtHdCbHE05I6Xp8P9kocL+Be1jJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720686; c=relaxed/simple;
	bh=nyiGRPw84v9lwfjRJbd1/D/bHlTM+QmFadF6+0EwGrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kx8utYgYBIrzz5G1oVdH64OpZEcYC7DYi04Z8pQEU9GSnPegfWj3t93v6SoOOaJTGbd3GHY2qsZOs5Q8pp68aaR15I2L8WgVxinCcYDzvTrKdZu5it/3gssHsYfrwrfW/qEtaAHM/19DMdH+C6o97XAKQrtp7L/9sNjpHIWN4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISxhYBp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISxhYBp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417961F00898
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789720684;
	bh=nyiGRPw84v9lwfjRJbd1/D/bHlTM+QmFadF6+0EwGrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ISxhYBp1XjUPTOU/33vfrOxuZC2d+Q3kQjhykcWkGm0JQKT0adQpFRvlvW8SwS8ZR
	 2VsPlaocRTemgEkbHMu6GfSY0PrSXICnmxaH260WiYwzLX4WBl7HqEI6eJUJKNR1cN
	 31JHAu7/BLF1F4DDFSdgmFl7QJ/GezoH1vaQPj52y/ym/5nuQwvnrJsnJP19tYGSeL
	 QYyHR8eh7dmUX17Vn5O4MKnklpiMijnQhjDCut6yyiDgU7vQYzhCXrI2ggJb4nHiS/
	 24R/SjHy5h8/uXcQMQCphmykjtct3v5vIuvNRk+81EzT7eDutZOt95kkjGbryp/2i0
	 9fWtDQbQaNruw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso471937e87.3
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 01:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAHNotZMS0kLRONBQL1V8RYjwU6ME0Z5S18T5xW7K9ufEzDW+sY51VPNIN8pLBDcsrimA=@lists.linux.dev
X-Gm-Message-State: AFuF++kgeCYuZfmOkQjrnvcC/ZTq8cixBtBnGamO1BA4U68wLJR6mewj
	gAnnuBuLIW2+3UlNEfK4FiRk+7UwYVorW6Z0K1UXVDerr7wZNd6ocVz361R3eM9geDmuegTCHBQ
	cmLc5LNhERjGPYtCDRe60xJPu6hF9VXU=
X-Received: by 2002:a05:6512:110a:b0:5ae:b259:75a1 with SMTP id
 2adb3069b0e04-5b8c17ee5c7mr468241e87.12.1789720683033; Fri, 18 Sep 2026
 01:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-7-88d29416e3c3@kernel.org> <20260917230646.AFDD81F000FF@smtp.kernel.org>
In-Reply-To: <20260917230646.AFDD81F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 10:37:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBKhM9S2bG9ttiA0R7jqriQPH2SHRGvMWq1XzkTMc5zw@mail.gmail.com>
X-Gm-Features: AcwNN1UCI8p1qU45iM7QZFxLwNfb4MbT_iNZnqOGLT43rWanvJTWkfzEs5ZfrgY
Message-ID: <CAD++jLkBKhM9S2bG9ttiA0R7jqriQPH2SHRGvMWq1XzkTMc5zw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ARM: dts: ux500: Convert HREF audio to audio-graph-card2
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:06=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] sound: ux500: hardcoded TDM slots break dynamic channel support
> - [High] sound: ux500: ABI regression causing loss of DAPM pin switches

Nobody cares.

The old code was not working.

Yours,
Linus Walleij
