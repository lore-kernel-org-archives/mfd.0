Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C750C287
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782385; cv=pass; b=TNhSjHsWZ5sUOqlyMSB9IBpU8a9yuOa28ayVg1A9/I+QYVyMBaxSuNo/fsHqK06qMARwA3rbqqZbTq8fM9jyXqHeGM2wT98Gf39jrChHX43igI9W6ZU+9J9F1PGo+TYOOq+8vRH3EMuByD2O+XFw0ZqfygohP6IpM31nqsRCosY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782385; c=relaxed/simple;
	bh=jKEqTeivdQOtCzgWSJBttzXJT/4mH8xL3yRAI43cdyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ0lLicAGf/nUR1rcjUUq2gcLJbworkX0IHbiDMKTiD4Dx/buwD+Xn9mwJZ0UnzVBlk94TNKfW+IDpZU5nY/eh7WLMRKgNXhOZEFpaqgWVI6AkRLWHoMaEqZFMCkbkatQw1010pIgROkGqTXGvDNy1oczCbcdoNgQSO+linqlOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+peoPxj; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+peoPxj"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso5430814eec.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 08:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790782368; cv=none;
        d=google.com; s=arc-20260327;
        b=A/UMrUxxLu6texGbNG6qdb3EWvaj8JNqTUAUNjpx2ygxzsxTCBILg20qkOzdH3wweB
         OUEyqNSnwCRQar/R9YkZehRiOYsKI8OkHYviTxURh8OLxFqPsAPx0De9aiMCPXpwdfM7
         XoPYHT0vhgcv1OnW3eDaeYN6wd6CUEOXs3IhedMAMrTdYtQh0w9s0g8qQ+by2pGOmh0I
         kNjcx0fHd7d53iCW60+zpA5s252xAL383qdddveWQ6nlwhseba6Tb+GjVszb9l6XDFQ6
         rMnTFPmayXSmfUfAI/nRG5GgSDajsFl8VOMGi+6yliQM17CJ/zkJdHE5l1EMZDSPVGIz
         piCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        fh=M2LiVMrK9dyr0NTzyQtwnFSbtsjXf1dOnOJps0K26po=;
        b=dRV9D3Vau3ewk2r0rV6wlEwsuZdPbEZfBybGt3/pl6ShPUVxVMHaNqRMlC2vTcLuZz
         i14linbsjaSwwoeoxDG7fwKzSZ289xMwy03orv/3Jg+z8zmb2PcvFRjcOGskyJBAgR+l
         sZ9j/72aXG44ynZF91wEWgORH3jMCtYkw70QVEGPa0XAa+vNq1xrEs3PeKPBpLhH6v5N
         h46un9EgVw0VRIxhFBQ8L/fgTASI//DNRWFiW8XM5SOXSUMp65D4hvcJVOF1UHCGkX9x
         HP55b12mgXRCZCs7TKu+fD+71VFyfF/7AXAXoBQ4I3DFF79ghKqUQJ5++b7pluBwAtDf
         X62A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790782368; x=1791387168; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        b=X+peoPxjwvXfmuAit1MA2jC4B0YBq7DlxImQIBXtd+w2YiywkH+afdy9qhYu3MynJS
         Mr20cCIgZ4KQqVLbTR3l6pG2B92nZdhB4bMBs3K6QFx8h6aM5XLqGni/wE1ciTZTF8SE
         su+tqWHGa2QFFvjKD86QP04o5BpizLSDzfQOl58+mgy7MjQ16hnu7D4094BJ9Wdt1Qb4
         VwtExScuCQ8//mUWpGtiRESaIg+jAJx3mgQp6FVAr3nen1R4Wz20Lppado1VTdCvWCMn
         lJ9ZNF4+q9FJlYEJEh/mbXPaSq/BpGsiHYV8WcKjQZxLBFvUa8Z+20/AY0kYTu8O3rKu
         Y4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782368; x=1791387168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        b=FmzDc31paYXksebpKRO2DVXuwozT8FDNAelDrhJs9OI2JMPTZTWJEqHsKpxGDcENn3
         TftSHxxDWV5DS29L7ecPiwGp3W8mVa/4eHH3uUsLXAufYyX3Hw9dAtLPfCpM8/nj5egD
         8CWrIA0A0hZxRbyP7kwYa9my8ZDSYBJwUCwovwbyH3Qpm0W9sDWPOsJl5BrdsbB0P2lJ
         fHtLktHaTkvWY7lOfZMp3wjt1/wh1pX6+JtD1TJ24o2Q5PpVY1W8Ag/H0CkRdORSNtoO
         ktgKM4tkGVdwcPfroO0y3Wx345wkH9uVCykXcpxc80kHk0mgln/9BrHWUfH9PR3MjJKM
         nvZg==
X-Forwarded-Encrypted: i=1; AKwUvBw/f/4w9MX7/Et2A97R7p/10gvdHNpB1T2b1qSZU9oTDO3e1YrZjPtnCbaLnHO9Fdwm5Pk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ8K5dU4QDBqwqRuxqR60XbD4XPRRMISfEB3saLacgH7UZSBmnk
	aEQr0KJN/PjZn+dsIK3aRMO89sF48LLOU1kIs+xMrYtzufcFiMBMR8vlqsYNgomMgCwXuByjLxz
	1Kl+bq+4QxYH9xvmSYuU++XQMDm6jEHA=
X-Gm-Gg: AYBFou1Pgi7MAVnTWLxkFcw4KlbLzI/dxwvGw0r01AHVDdFkljTVRm5hhMxCWNbmCl1
	q6tzmxFNQ8hWIEKoutiFOs0f4vkClhgkHI4atHllme4ynTWP+aEMMF5nF3AhwDVH0U4RjouIKgc
	L+aupVrFLDnfPqmcb2/AvC8Y0MPNWn+QjI7ROH1kgdNJQPNKBxTB0jZPoiUGGqKzgr/zIYtmVME
	C8ssgdTQrCmyQ+7JucJgSJjtJUxAgmR/0VZNsiZ36XD4RebuTwivgOp2XXlH0HaRKRKi7GXFAhu
	mjiYede9ODToJrf7ZllMHrUm1Jahh6mnSZNt4DkYS7CPYQWr7I12C83RbL+/33L7tee66fiTHYR
	YrxyYvz+9O7l30A==
X-Received: by 2002:a05:7301:4e4b:b0:34b:fd9e:ad4f with SMTP id
 5a478bee46e88-34cdc4beddamr2091392eec.22.1790782367990; Wed, 30 Sep 2026
 08:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930072732.66578-1-clamor95@gmail.com> <20260930072732.66578-2-clamor95@gmail.com>
 <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
In-Reply-To: <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 18:32:34 +0300
X-Gm-Features: AclHuK-_tulOAdDAmKKjx8njVHGh0FQ7Ovbfd5JZjEuw69vNm5JUgMfqqvzwGzM
Message-ID: <CAPVz0n3DseAutXOXAmD0mkmim-zBkYrW0qTyxXjwQenYW+GrNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] leds: Add driver for MAX8907 LED cell
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 18:02 Grif=
fin Kroah-Hartman <griffin@kroah.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 9/30/26 9:27 AM, Svyatoslav Ryhel wrote:
>
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/leds/Kconfig        |  7 ++++
> >   drivers/leds/Makefile       |  1 +
> >   drivers/leds/leds-max8907.c | 81 ++++++++++++++++++++++++++++++++++++=
+
> >   drivers/mfd/max8907.c       |  1 +
> >   include/linux/mfd/max8907.h |  2 +-
> >   5 files changed, 91 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/leds/leds-max8907.c
>
> Sashiko said this does not apply, what tree did you make this against?
>
> https://sashiko.dev/#/patchset/20260930072732.66578-2-clamor95@gmail.com
>

Hello!

I used tag: next-20260918 on top of commit 3f2425f5b5bbb

>
> Thanks,
>
> Griffin
>
