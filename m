Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354151;
	b=uVxv2VJjQzPYGEnQZIvRkSwcKCQ7IrEztg7QpaspIi4iNNHGgnYGFAaSiQENMONoBP7z
	 vvHV8E8iAvuORbYKfygcmvWreAm6IFpG/Foqz99X5djOp5ntNtqklXbtk/woa0w4QjZwz
	 NoAPrUBKuP3xri2moNoJe3UyQH6ZhMd3OdmwEGzNJtf5LwW8+guBMhJfHkaU6WgFfEBQG
	 5pLf0eEZhwPXa7LVKPHgJglDsaYu++gTTDM+rnpOPo4XiL3QYwDaMIbR+4qvBdiBMEofm
	 Yy0KsCLtD6JCsy/FOHvlKoTHFUwDxb+GX9q/5nqKRt/gdaO+NxHZkLTmzdhnXCE5T1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354151;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CsUP7uvted68zB+90tj7YUthWbvQdljORHl/K8ISItY=;
	b=zTJMGXXYsPzsX/YHKfb1IsBXvc6SwVTKF0QE0sKIsOKesKcHlpZjy3y+2lPZAL+vqsLu
	 iYX0P+fcVrUz3TPtdVXBywB+IJm9YJ5zU+rnL114Ls4X47gtnyONc3NH0AYlZFgdwmkzZ
	 nkiCSfgu9AyqYb6ghrPHfnqPwXv0l1efuItXSeAjF9JQDECqGYFd07aHzLc9bRUtEQMTo
	 EBv9F29xe2NrgIu+NXKh3RNMtwlvnmkyREiOQmNuroSynFf0DJYD3BtmA3zmHxX2SY/U6
	 ZNiIVrgFfRZh1PuVpd5oHDXfFWZ6Ko4JmCPBxTZ6zjnmjXeLSWbRSy3NjnboOrvh0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=NAxcib4x;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807C606A320
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 23:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A807C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=NAxcib4x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794354148; x=1794613348;
	bh=CsUP7uvted68zB+90tj7YUthWbvQdljORHl/K8ISItY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NAxcib4xPHjyl4LCjL0Kc/O+zU6j9SE0tP7NP3Ac28mazEbo4HdkOYj+YZB7qFJ8E
	 ipTi+947Arq+aNsLlToJwJ+VulJIiQqjb2Yd00j5vUf2U87v0TjmB/jibY27o3Pr0U
	 z5m0F3oCZgLx1ih+Ey8c3lkmWEHrXkXgMhsq61+Vrg1Bh2KpaNg6F+xrB/5z8GrwJs
	 UmybeO7ll4pQib02YBQjqMCC6QZf3okOSJn41VY8WYl+pLsaqSz0FCUA86GpGWlJ/l
	 IG+LWeKxq38J92xytrAdKHW9tl7zEafEnKg5dJvOGvlvWfw4/RhWz2jd6RHeLVt0Je
	 iP8nW3cnnlMFg==
Date: Tue, 10 Nov 2026 23:42:21 +0000
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: Ben Grisdale <bengris32@protonmail.ch>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <738177eZDQjVkBbNjeXNQVKLv3V-twRGcbGlGk02RsZtm53MbHqt7pcsoigp-ZV9xh_ehAVHa4ZZEvXLXFbrOw==@protonmail.internalid>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: c730cca830f1d3a8b357a1e7430262ae4c743f50
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi folks,

Please ignore this V2, it was CC'd to the lists by mistake whilst I was
testing my mail setup.
It is identical to the patch in V1, which is still current:
https://lore.kernel.org/all/20261110-mt6397-irq-num-fix-v1-1-81d17454194e@p=
rotonmail.ch

Apologies for any inconvenience or noise caused.

Best regards,
Ben Grisdale

