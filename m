Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA43C1974
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365037; cv=none; b=JdXnA2E1VksOeYMiyUTckhKe2S4G2EqlUU+Yw5bJo5Bo+aFbzbYWErfRyy0MjDI2aYyAtDATFfR8wbsev3ht29LlYe7JRTLkh6e1/fMNzZ5t+rHqTIuuy+y0rQW1IfPI1JvJsHAuWVGgsykJ9w2rfLPsqil2gIdNRwKX7U9+9JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365037; c=relaxed/simple;
	bh=7e/6sheO04dSon/ng54rOM32qe8/36dq2O28PM+xUug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hsn7u3mRdlqI7vxe0CMgq6dQaHFmQVbw28w+5lHEbzuzBEib4PmPVPhSMtjcb5KGouiQ0J3Sr7VtPxT0bWy7+gXbdU85QuUPAiSZ6vaYok7Q0+4KnC3dVsQ9XiDwP64E83Uts2ge3y4DuOehxI9AnOq41kZ4CCMidCXCt4PNmzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWWfdbGA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWWfdbGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD711F00A3A;
	Mon, 10 Aug 2026 12:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365036;
	bh=7e/6sheO04dSon/ng54rOM32qe8/36dq2O28PM+xUug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWWfdbGAwFo6/bmvL0q46k7Lxtyd25GpveJgH1uCnYed9xAuj4Ue03ezxmT8pHnsD
	 twqLy9RZasYU76p4Q/UvMN+f7eDekJHwYPu2Z2Kl0zcifIg28FQSCE0V0DygXO53In
	 bSI0qas8KOtQrj1vYclEMynXXtJ8mcBK2+e9dF+Dlmny2okWi2RWNmPA4CtkTRXY88
	 jNWghn0RR5myzjBEd6ohql8rTAbjsQfRyzo74HR44CMDGWO99BBk8CuOoB9fxkEWHO
	 Du5vvrv3z2yvIStze+ZbzDvqQqLP+GtOYc47YX6efmIMTAHB/LJMz3K5UE5M5Mum1c
	 QJBHui5kziUyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 7/8] gpiolib: add gpio_device_get_fwnode() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v7-7-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-7-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:30:35 +0000
Message-Id: <20260810123035.BCD711F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Miao Wang <shankerwangmiao@gmail.com>
>=20
> Add a helper function to retrieve the fwnode associated with a
> struct gpio_device. This is useful for drivers that need to access the
> fwnode of a GPIO device for various purposes, such as creating software
> nodes or handling GPIOs in a platform-specific manner.
>=20
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D7

