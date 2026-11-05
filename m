Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896745;
	b=XlTaATVoPsf8uKUYqbuEN3wvHPNGGWfhXCTuRjInmWnbAzpq+6+NAhl+eTjtxn7ubBYI
	 VoslI4Srg7rxDjGQkKENhJ0NVyRMzvfULMuZwOp9qX8D0P+IhiG99Jwgv+q/5FZ/TROfE
	 NMNwhmqe2/7j++HpBo92DkNat3oK7Ix07SSnmLLfd1Bqsg5RKA+QosT9qo59kZleYmKI2
	 AT+6noKX5dv5Eiidq1ouMQ6zm4vGlwYJNBCXgjk7WfF8yeLaqFtIIDcYgSouLcj2T/w7Z
	 W6v1WnRBArFaHOWRR2BHu1nq6rnObR6Q4NJZ3zYDZD9F2vYTOJwLVSsH+oSRaWRGkOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896745;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ULjmTEbROdJQVZEfS/t3oTBVzuiWguDK7u7YZ/yTH3I=;
	b=ayccR1kKvoufP1etH6PdRYhtXz/NswnE0DRC3WAZ2yp60sPzPbW/kL8RgqPxUZQz1Gel
	 lRUvUulEzxuGXy4efeA2cEn6OhjHl0DewfgxsJsfhys+3vrmoj+WeYT71hADCjmFI9FM7
	 Yu5u1Yi0BkjRFVQoKQjXEV/5Kg0cftulqkRRTIXKYRYvhXC1XzX+dFun1W6KboSt2YkjU
	 sm7+MV9pojbauOMRU+pf5b/OM86zw7RtEIW0x4AjXUWRQnX0vo2cVM+W70Bp0Q8+amzVg
	 bQpdkZ92AWnAwgtxEMlwYrngBLN04cHnBI7wq5QGP9TM2AOZB9OyNgLLga4waJJiipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Df7kv+Cp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1077606A337
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Df7kv+Cp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684EC1F000C1;
	Thu,  5 Nov 2026 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896744;
	bh=ULjmTEbROdJQVZEfS/t3oTBVzuiWguDK7u7YZ/yTH3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Df7kv+CpBSgjFGB+sGhI/Qg6GdGGJ6m6tgdqQN2tq2SNk85bSH+UuOb9RXxhK04QJ
	 mMF8aRFyVwxx+n99SDPN9qkZkrdJ6et9GndtS0UvIDQR5RpRXzSJZqCmx0Rvo7L9IQ
	 3Eh+Rs4PEl8o7W2uOa5/eWZFfhYCSnRY+uQ+Yh6SI2NP/d9b4d9TAD9/Xro0FuGay9
	 /OVQ3aKS9MrTbY4qQJI8rMcKgtO2sWlF39ctmMImy9hVKUrlcWgPArQ9ifAucx8Kj5
	 wMi2R0rxSddRaYBCiZ59GoxjV93oBVuNbVbTtXeu/8apwIEZtDSqXMyww+xDV1T2z0
	 x3Sdapi+yUPdw==
Message-ID: <sashiko-outbox-199510@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: si476x-i2c: cancel RDS drainer work before freeing
 RDS FIFO
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105162722.1688960-1-hj351016@gmail.com>
References: <20261105162722.1688960-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:39:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: si476x-i2c: uncapitalized commit subject description after pre=
fix
--

commit 0681987cd726a1a3d6c3c547f0ac0af0aee3c7e7
Author: Hyunjung Ko <hj351016@gmail.com>

mfd: si476x-i2c: cancel RDS drainer work before freeing RDS FIFO

This commit cancels core->rds_fifo_drainer synchronously in
si476x_core_remove() before freeing core->rds_fifo to prevent a potential
use-after-free when an SI476X_FM_RDS_INT interrupt schedules the drainer wo=
rk
shortly before device removal.

>     mfd: si476x-i2c: cancel RDS drainer work before freeing RDS FIFO
>    =20
>     The RDS FIFO drainer work (core->rds_fifo_drainer) is scheduled from =
the
>     interrupt dispatcher si476x_core_get_and_signal_status() whenever an
>     SI476X_FM_RDS_INT interrupt is seen:
>    =20
>             if (status & SI476X_FM_RDS_INT)
>                     si476x_core_start_rds_drainer_once(core);
>    =20
>     si476x_core_start_rds_drainer_once() runs the work on the shared syst=
em
>     workqueue via schedule_work(&core->rds_fifo_drainer). The work handler
>     si476x_core_drain_rds_fifo() dereferences @core and reads from
>     core->rds_fifo.
>    =20
>     si476x_core_remove() does not cancel this work. It disables the inter=
rupt
>     (or, in polling mode, cancels only the sibling core->status_monitor
>     delayed work) and then frees the RDS FIFO:
>    =20
>             if (client->irq)
>                     disable_irq(client->irq);
>             else
>                     cancel_delayed_work_sync(&core->status_monitor);
>    =20
>             kfifo_free(&core->rds_fifo);
>    =20
>     disable_irq() waits for the interrupt handler to finish but does not =
flush
>     or cancel work that the handler has already queued. A drainer work it=
em
>     that was scheduled just before (or is still running at) remove time c=
an
>     therefore run after kfifo_free() and after the devm-allocated @core i=
tself
>     is freed, dereferencing freed memory and operating on a freed kfifo
>     (use-after-free). The sibling status_monitor work is drained on teard=
own
>     but this one is not.
>    =20
>     Drain the RDS drainer work before freeing the FIFO (and before the
>     devm-managed @core is released) to close the window.
>    =20
>     Found by code review; not runtime-reproduced (requires si476x AM/FM r=
adio
>     hardware and an RDS interrupt racing device removal).
>    =20
>     Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

[Severity: Low]
This isn't a bug in si476x_core_remove() in drivers/mfd/si476x-i2c.c, but t=
he
mfd subsystem convention is to capitalize the commit description after the
driver prefix. Could the subject line be updated to:

  mfd: si476x-i2c: Cancel RDS drainer work before freeing RDS FIFO

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105162722.1688=
960-1-hj351016@gmail.com?part=3D1
