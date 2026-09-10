Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D16F33344A;
	Thu, 10 Sep 2026 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081677; cv=none; b=taGU+qPAs5eClggMOIyfne3biZLplOJWoHyXB7YL4K/p4VoBz+ybXYSK3A4dXt/m8JWeJTdk9z/zRXzm873ji7Ot8io1UYiKjHs3uNrhhbKVhtdpNfArfF+bioumJIXWeGlC/RDx71J5Hb8dhUUaae6MhxoD40RQ/xKNyDp5Jfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081677; c=relaxed/simple;
	bh=SjYjtuQPivZo6ehE67an/ecpnepYkG34bVaGreFzVo0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eRXKvh2XUWbUz9Q6fzWU/lWIvzz4fUJMYnH2oN5Bhsx7U8AMIGBEI8YwiINpJFmyhoh9aaEA6sLgsRAtDbFX6tuYki/XEvt1s/NG9Z9rpOk0bcwM0OvQVjGd+n79S/ESWxBUJxGvq/irNERCjEdZ7/3Tb9L3Z9adEszx69g8Zsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1WsOVGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1WsOVGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0451F000FF;
	Thu, 10 Sep 2026 23:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081676;
	bh=SjYjtuQPivZo6ehE67an/ecpnepYkG34bVaGreFzVo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f1WsOVGMKUYw2H9ZOQKRUcPGGG35tMimbB4gdLesNHmVCYGThf726M6Cq4zthxnV/
	 24gEnB0D2Ovz7wiAXhOXYKq08olHZZfhevgCAWnHQo+Fc/lWWcAhLQktzB6loDC5RF
	 55UHl7c1xM0HGOVdmsHdQu/pgm4ZiWQ2Igk6Ifl9TWHii9LxiRn6a/r6lTvM0lkD/S
	 aOvNAIWcsXryDcyHkPHtBfTdxZy7Z5X/eaXZ676BMkubOSkWMeV3wBCIRKQMzERbh5
	 rc45Gi0QAY9FxCZT8ogrg04iZFRD9rFZNZcE76mQZBmSGFrMGfIst9vtXLqEQUjDJD
	 YNCVta8+WueRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] ASoC: dt-bindings: ux500: Remove MOP500 sound card
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-3-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-3-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:07:55 +0000
Message-Id: <20260910230755.AB0451F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The Ux500 device trees now use simple-audio-card and no longer contain
> the MOP500-specific compatible or properties. Remove the obsolete text
> binding rather than retaining an unused legacy ABI.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D3

