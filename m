Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7AA3BF69A
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848983; cv=none; b=c1Bi7k82h7JIYKCL8ZCeVQ6IRebr5gVVPqHRbztU5+AOKQRaxOn3s0VF07eoor31Epf8gJk8yMXioGDOjoEugWRf8xspo8a1BagCNVqhYY0H3VvCS83J/O7Tb9qw84ne9p5HYOr0XZZnlDYjUETQyzfQad2ENL1d7ax8MbclM/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848983; c=relaxed/simple;
	bh=nTAgcUffJtzoBhFU2Gd5trtHbstVVfIHR63s6kxJY0k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=IkWFvIsujVT/8Ou/rx0/dTfQ6f/gbC1FqIEOrdZkbfbwNv2KBN4O+NxtN18dKJYrNVQKSesLwh6pnsW2Ar8QpXDRm6FTt/2DYiKcwfV3WJCoXuVbrDHyUaQcY233XzhXMC2PeLk2A9Dyvk3HBL70WZxerl/Fu6Gc4+/hPFXfAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmvAhY3+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmvAhY3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DCF1F0089B;
	Mon, 12 Oct 2026 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791848982;
	bh=nTAgcUffJtzoBhFU2Gd5trtHbstVVfIHR63s6kxJY0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmvAhY3+wdApXuXrJ1R3nPd5IdSRW+VNqkEbKE/ob85uNx06GpVnKe1NQl9zQ+LVH
	 ZIUre0zkmE5OzhnNqLfiCC9RofuaTN7u/pWR9PWh19OWqCHi3BveZYw+u9pIjvLGDq
	 vEIr6N6NjwAlhfVHqec9qSjCcqd7ivIzlHt1t2mjLhsgVh/D9qnNA31OEKIzUyXwWc
	 hwpdZgimq8uwUTeo4nv7BYZ6Toz//dpC9zskkeeCrOoiyRXv5sSjpP/SGkxsdV6Pz6
	 8uBEIUpB1hA/ZzuzP1uGhhxJq/fk8Mr7UE+MsayKj5QhB2MxX4eGCpfeJQnGFCSwHP
	 8+yFQV/jXgmxQ==
Message-ID: <sashiko-outbox-168737@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: dln2: Fix use-after-free risk in list iterator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Riccardo Oliva" <oliva.scorza@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261012234230.17966-1-oliva.scorza@gmail.com>
References: <20261012234230.17966-1-oliva.scorza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 23:49:41 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> In dln2_unregister_event_cb(), the iterator variable 'i' is used after
> the list_for_each_entry() loop terminates to free memory.
>=20
> Fix this by introducing a dedicated 'target' pointer to hold the entry,
> isolating the iterator to the loop scope and removing the 'found' bool.
>=20
> Assisted-by: coccinelle sparse
> Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012234230.1796=
6-1-oliva.scorza@gmail.com?part=3D1

