Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D137E316
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756941; cv=none; b=PriYd/Ecv+J8Rqbgnb8fC8Qn/zrFO/VpZ/M4Ap9JUJPEwlBeju908OfpnHmFLQDA2qgesqGltVl+OOPpibXx5qhRgm2S1kfCMFpJf7yRjQrYPs0JSrU0MoYoEQbzdHKBpeRud34vN4s5hjI8pC/mIvlty1gSZIGQ1obrbuTjVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756941; c=relaxed/simple;
	bh=kTSBs2srvUC4krcdQ7z2Oygfg1BZ9idFVoUFLYlOEE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uExHva3hu45fhrUt8RbrwRg4usaAQO0sngQeL+LRpgdp3BVqO7xeXnCQYAmn7zzMhhha76bLshPXCROAZH8IWNVwmJP+QcFrZHHthmcDGG1dRpW0CSsA6ZzJgvp9JnR/uuHXsc94+gHI/OR2KydqmFi6koysbsmGi1dQwsjm9nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZObbnzzs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZObbnzzs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849941F00A3A;
	Mon,  7 Sep 2026 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788756939;
	bh=kQiyN8X/1VvQns2AL1WcQU/BTqfjRcBn1u9z++XqmJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZObbnzzsd7YRHB4U4kVA3xyaPUw8fQHPoTo6h3lVYoR2golsC00TdJ3EobFo04gtj
	 XjAQptR6Jp2iNBE6xfd4QCdcSuedq6thjRoOy+kSKioHp/sN0+YmQxxApA1QlO10Eu
	 Yv0hqAiYGF2sRrJZN2xo0Pqg7aOHOYGzQ81DR5kcVCHkJYif8igqkjk2oiRFa6oq66
	 Al8t7lES/6Og2sFiZh4uU7qd9mSM5UIZhvpWvd8JkXIvkpp3NPM/wigJoQM05C37rh
	 tDxeB/DUYeOb5DAc2oa63uiWjrBqVC4r5Q8ahfCqqyAFsz/dA5kT+4Vi8vWWXBjhtC
	 Xl1Z1HscM0oSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] firmware: cirrus: fix typo "upto" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045331.16932-3-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
 <20260907045331.16932-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:55:39 +0000
Message-Id: <20260907045539.849941F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045331.1693=
2-1-hemanth.selam@gmail.com?part=3D2

