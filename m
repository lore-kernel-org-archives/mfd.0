Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400923;
	b=vgUBVpB4bwiGZL6gREsgl5rklE4FHaozY0fhcqlwNn3VbS77zWB5KS2fGUeNSmfjfQtt
	 RUklHi0DUOG5ZsZfFLEBfptS8XVn/GY868JC8Lei/G1/cWl1tL7IgWyqqU5AX78oF/PQ5
	 fLSUPQBALIGES7zdcu+Aln+2O7eAodzoJqvgntLNKYRYAS4wkEe/vHbO+WqiwdWi6N5yu
	 HxmrpKKTKHzmKX10ioOFGffFjhFOzvRu91Oi4dmVpce4sDTIG8jNH87njP0p24enADblK
	 S6zNl/zm8xLgiGoB/fdsHM7G2rBWBUs/4kCfVu77r1U0pzH8snleqVTc3KXqKbjhyTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZicVV9Z+dbEcvbsxd5GYeloidM7KPsn1mE2hWsjYDlc=;
	b=m9Baly9Hu60ZHNUNY8riHTQIu8IU6K8Q1s6I0tytg0d06RQtiKefzA1k34baxMRocYvF
	 fZsmipul4p0uJFD85uFm4VNVvjXTx05mgmIZwGOmILrBUaj3Y2Etg1lNrqUm6h8oKuhCo
	 +eahqF6pZVVgLm4kLeG68UuOdk7hBw2YtFlImPqncbJG1Xi8i3oj62K+ty1qnmdZ+36uD
	 0vTzmkyb03fdoe12ubpV0K6zaRh9ZaZd8YottsU3y5wB+pid1Z/IDt/0SK+E5E24LMJp7
	 YwFW0hGLD7EsILjDXMnPZT9Cewk//rkbp2yDsWkwrrGiAdPCOR+EzYimfO0nt4n9YMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtZb5XBb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC7A606A320
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 02:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC7A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtZb5XBb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3866a784546so3455076eec.0
        for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 18:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400922; x=1796005722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZicVV9Z+dbEcvbsxd5GYeloidM7KPsn1mE2hWsjYDlc=;
        b=TtZb5XBbbYzUKjHf/pu5z5WizdJg5JGYCmcFcMbhGlbdhbcXulH6oCXqHSbIK51IAo
         jmOrPwdbCL5R67PdnNw9obo7oodSf8eMGvRsGz+SHqIquTZaPTyLmB3qTMefT/QB8kem
         hEwNiFnQ5oZQRcVLwXGhve720M5Hw3lBFlO8DFyGuXtogfSfD15Hxj4OW+vs7Wijd/zk
         kSqAXfrhkV4v0sTKU6LRfoqucqaX0cTxVY/XK8Dq9zkTxyi4LURFpibqK3qI+496pmT7
         ahRQ73uUPwH0i/NcbotikoDN6uGPz/lUnyLTImSiMTrOgoYJeNZJoGRGXPHNzBHORPNc
         y1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400922; x=1796005722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZicVV9Z+dbEcvbsxd5GYeloidM7KPsn1mE2hWsjYDlc=;
        b=q2p0bizKfrvqBrSakpTCdYaZAMjp6xnvLO4YbxlJij/1L7UXek8LMdMNwVw/2xghoG
         xOEvPOcccyvo7Ri1j99rpgSFyLIrGty1HV5jsS1++a6CEEPyTzXbS1MWE+zrgAzYbx95
         sT4vZY5wqOK+3qRRe8uKPKyhMO0c8sc/OVYQaUtHDE8Ox6I8og9zjDIJZxm31QTnlGZF
         pt5ByrB2Tag7HnEEVnr5rNTSLZ5Vy/qIAp+K6VmfUb66oBp4rNddmVGbVEYXz0GTDrOp
         urrc2YURryLLo56xCZ3kGK9rncjROD08jaZyU4gcn+pOs7tHVQfnMPY+JsT8QHIRNlbf
         8KxQ==
X-Forwarded-Encrypted: i=1; AL+hErEd92mSd6PeE/OwYcU9wmzRVcVEPeD3tMhqWa7sbPVz0c5rx+U25eqIF5eEbTEUK1AP3Yw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fG2CESEHnnYUJeEzkDDmhAQfCKjhKeCI3G4z7lC/98OrvUV+F
	nOfIxY9RmuJbmd6ZHvWfVTtRdpBYe/7dZ6cVvM8d6KS+3mqaJm9mic1F
X-Gm-Gg: AZFdTZcWFCx25z81rnso2fglbQm8Bb/tyKTWAwkaEF0Gaymf7tWq5jDa1vf4HM65YXJ
	5pv99/niNcikkz17v4iCQXVP5HGMSC050+NZEbS5dh2G+nZvffCe8rfeLUaUDQc+flLoJAsDhCF
	r2eFB3q1qbNRIUmCowRO7xmiLRzr0PYM+EofnD+mCfwZHO3uu5OoZLfmI8P51fgJVS1j/mkCUbQ
	NQDl2CucLoO8YDdVvVZ6xKyTFWaAow4mcCa5l7PEBCEE9EhUBcJdPkPJiSskvFk+SWJs9Ko7+Fk
	dhG+kJUhZCQrfGkgxL9IPok1K9pC2pfCi+U5Sr6gOAfpaQygcSGI4fgTLqpGem5e1+EBB1GjRLs
	PBpeb2+R3WX9PEvQKDT0KYJDEbb9TJk0yyNOUOR04OZ7UuHBE01vYCu+are2jG+YMqkeBVCm/7u
	KyzmktQ4OQPRfMwWzHj+QATdhojg2JXCrE37JlSmbx2tLbkJfqKAzN6MvdrlejbcTkHL9+Bmjjy
	hgX3T4/L+53tlhp5e6MQ4LmL/ytGJWuGCxz3NzgGxbucjDW593HMsVOKvEsnMLzHU6JOvdGo5jZ
	p4oe8ahHaDsktyjQNJ4L8LmbEnzCsIBEe5W1nT+5MFA/+4zSpC2pbMWY74oae1iX7AX/Dt0=
X-Received: by 2002:a05:7300:50c4:b0:386:121c:c275 with SMTP id 5a478bee46e88-386121cc3c8mr9558886eec.10.1795400922103;
        Sun, 22 Nov 2026 18:28:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm28632639eec.16.2026.11.22.18.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:41 -0800 (PST)
Date: Sun, 22 Nov 2026 18:28:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/4] input: serio: Enable compile-testing for
 SERIO_ASUS_TRANSFORMER_EC
Message-ID: <awOk0yzFfiGt1kro@google.com>
References: <cover.1795355432.git.geert+renesas@glider.be>
 <234c01e4ac98bf72e3e2bbfa7b4fba635530ab8c.1795355432.git.geert+renesas@glider.be>
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
Content-Disposition: inline
In-Reply-To: <234c01e4ac98bf72e3e2bbfa7b4fba635530ab8c.1795355432.git.geert+renesas@glider.be>

On Sun, Nov 22, 2026 at 02:56:32PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The Asus Transformer's Dock keyboard and touchpad controller driver
> builds fine when MFD_ASUS_TRANSFORMER_EC is not enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
