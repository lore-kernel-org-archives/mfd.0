Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658347;
	b=iS7PXkEJKFw3pfI2zHgTb9kq+LMozlCZtmn3VNz/8RrJYlQoFO3n4YifB7YWOgxM8daC
	 H2v8MgMPngReqlCfFwFGhpwZi2/Rc90HOPf5p7ExIah/6CAnG8bug1qCmG7y26CtuXryM
	 0csLaOxQcgReYmGEN1vl4fCwdyBrEf3hmnXjAPO57DpsNSa9AtdURuQKkt9UrtC56dxey
	 I1FoIwEFSLYets+ZZM/wnEeWxVfQKToFDvSHv8b2gpfeuqDbwEkkHhd8PWDwOxl63Qhvp
	 9mDTKgoQrgEERm9az417xaTPEkULguwK6OyyQTo7ZPphwPhpfhhgMkbXRXy3RjTJ/7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=i89eTKEd9nUNwOxujCelwnTBTU6LyXwneiUQ3QsPfoM=;
	b=1w6UPB7SuMwRsgAxJ3MXP2GpO/cIl1juDJuHTP73YTAStyAyL7jYxjbOIBSwVzbUuhkS
	 euOF+Bx9pQCuCtKa8dMLX8egO1GS53a8bZo4UtA7imVvZkjNzhzP2Z4BhFF4m03jBdxvM
	 n6yKAr2R1YViLK3RZVvFhzc9NeajiN95+LqUXVlSp7ovfS2YG5LPXgCAYakroTfEI3FHZ
	 aouw5gaD9bJiR6a5Sr6wI0MD8kcArHSfc6cYbrXk8+vx/OoVRxsqwZe4nDcMnFkIdE1gQ
	 Z0iaEiDZJrueqpP6KdOMrX46No6sjyvogC1BhmFXoa2J0dKyxF/4QKnHEh50WVuWTwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=a5+EosQt;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jDIoUyqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9F606A31F
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=a5+EosQt;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jDIoUyqy
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M2rK0x153321;
	Thu, 22 Oct 2026 03:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=i89eTKEd9nUNwOxujC
	elwnTBTU6LyXwneiUQ3QsPfoM=; b=a5+EosQtbp3bBcQpe/NlST0iCewYOlHuUw
	+hwvUos4kJeuV+nQX+ltf2Inxxti3Hlpaaqlq2ZSpnhCkcWEhBIBXDBJZv99Tlej
	9x2DtgdsrPm8MA2fNp1IFLzAbSqCZTyfR+VAReZGwgKLRl04SYFva9FepV41uqu2
	pX+p1up+xgjR4btjzXxJ28hT0fj1UTOXZR7as8aCFVrZnZBbXwStZcNHZoJ0Pn5M
	erUmKDqYAKkrDjDE8ZPJFOGyuF2JfR5z/U20NEgAakAxqzlDs1hHFsAlkZ9WeKuZ
	nMZ67ReDzgiIsfIOOP0YKiw0PcTm5TMDpDB+gl1/z0dlc+cvgDzw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022129.outbound.protection.outlook.com [52.101.48.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hf97n8aj4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 03:38:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIpT4ITJ4DEyFZjcyddisRDBRNippwXWKd+H3Aci7/nGPMXZ16J2xp7WVi6dalbl9y3c7EXJur9T30zsTeVLWnYgqCNszEShbw2pnOvuZ4DXmnBK3x1jQfGw7HbBvEW+I8KM0k/pokIqKOyvK5TjNMeYLmbuTydtwoWGGm7dyqxo2NWJCNze+iA9cVjzaaeu5quycdC1EmAy0MOoPB1pRiSaeYpbbyh6Ee7KS+pzlu2G8Mw7rQsw/mytx+6DRqrjCS/J1pHu3UwB+rDYRrbzF+gdCqMGnk1k97zSRnxLpUXC5f0Vm/w8ykXLzvEJkWi2fUy5mVX5D0mDmv7Ke+icgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i89eTKEd9nUNwOxujCelwnTBTU6LyXwneiUQ3QsPfoM=;
 b=qR9II73eXnJwGIGFkCnzLaYJ12bxly6TwnCoqAYMzggZgi98Pb6it6joJS30cWH7XeowMde7HAEMM4PaiVgTPdr+YddqLBZ3dZRhIiX1fes4mAeqoHy9RdLEX3N1fvF1Ym/eCVCesxSzssWOWXV+jYfDcOEz+U+I9ppR2NfYVh9qwcaFtfh5cjNaHdXHHagQnCYdwsChVE0lD1IgoHQ2dJmcELVTeSJ6I9HGy8xDUUTZkha31Hg2h8PFV9R33VPl5Y2w8IRAxUA7D9W7w4Wixt/fS3WHN/986jzCjOZVA5f1ZuYcmO23Pi3xTpNByUqzQWkBe80vG3oVUTJ7W4caJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i89eTKEd9nUNwOxujCelwnTBTU6LyXwneiUQ3QsPfoM=;
 b=jDIoUyqyf6q7PjSSdX3/jhRB6WYWV1lS806YzB0iYU8GlAEkx47HqYhPN94belFPo+WpGpnMTdThbxcgFtCk+PdG38sEM9diXKTLDDaTMqMoOU/wbYwKiDwZ79UCOP0s/hsnBopx07kd5Hp5exQLBh7Hm1OcVQCsweDh5x6gSf4=
Received: from BN0PR04CA0066.namprd04.prod.outlook.com (2603:10b6:408:ea::11)
 by MW6PR19MB6901.namprd19.prod.outlook.com (2603:10b6:303:238::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:38:53 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::a1) by BN0PR04CA0066.outlook.office365.com
 (2603:10b6:408:ea::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 08:38:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Thu, 22 Oct 2026 08:38:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CED8C406540;
	Thu, 22 Oct 2026 08:38:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AC73B822557;
	Thu, 22 Oct 2026 08:38:50 +0000 (UTC)
Date: Thu, 22 Oct 2026 09:38:49 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: patches@opensource.cirrus.com, mfd@lists.linux.dev,
        Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH] mfd: wm8994: Enable runtime PM before registering IRQ
 chip and children
Message-ID: <atnLmWnAhPTofvMP@opensource.cirrus.com>
References: <CGME20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30@eucas1p2.samsung.com>
 <20261022075938.625795-1-m.szyprowski@samsung.com>
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
In-Reply-To: <20261022075938.625795-1-m.szyprowski@samsung.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|MW6PR19MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: aa226f7a-4d43-4689-abe4-08df3017e6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|30052699003|61400799027|22082099003|10067099003|16102099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sIoxk56tV40bxBA71gI97QnYD83h1FKltScJkkT8wPUWB/fZXjD96feCdGGpNvk7IH288rYMeC/SiD5/LUPGEshxTxK51Ub2oO548kxOufdq+9nSR0VG8pzaaljfzroGlABoWXXa4HmHbulOuVi3DLG+4aRw2muMWtItr56hsuH20mfHNNbz2oUdii4oow/Z+xrJfayohiH5amdNYHiqu6Uhz0pUdA76QyJpMg5X21+Ql5nNLhe/3LthJoPGMIlBtVlgfrSfBrJ/fFaav7tQlQJAgc/p1ZqlxKq3NTQGEoAzxfhA7I4PCnhTwg6IXb/hCv+Y6TGiQJMakDxy2BV8GH8Cwsmw+jplzl/ye9QszqJh4X7S/GxYQIcNymWdk93dtIeAHD8QDvCbtUb/jRjJwlNmEYCIHbMIlhUU8VRSlofSCOfGMAr23LVP6NyCkUdo2DFCLCKLKoNdo/F30sWciVvWp7AS8stxG5cXtzsI69UDELSza6Pxlr5vfl+yIQLSbyaaceLq6dCA33uQ2hjtXxSB4qbu0P1FDav8764flgcPfCN0Ne2TCASA3Sq8APjl2pVHrlKayzYDeXIYwfH/C0Sl5L7Q2IRbVDQi4rFjubTs/RUuJDfA9W/FJ45Ry3QQygxinVh2H9P6MHlA5gQrLKWq8lfwMVgFHGOWCajA78ulCQpth0+3nFV3LzDtkh5Nz0wGVYy81mdOlViNu0rdWg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(30052699003)(61400799027)(22082099003)(10067099003)(16102099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jHJ/K8M9Fap9UH64WUvj8vDQgTcSVVt/7YZD9yo3JSHvvAh9XecM69HXCczDELVJf6wGs7QyFZ2Xn8E5y1urJ/5ve4oOGoEwaUdMCvu2DjNcwJjlN39NGZIw2kTQgMtp4fVVkYTIWtUaOGup4d+S1iR40qXcY8XuXSSdWPwFIHGO9Dv6OAfvrEw0FUQah4wfOnK4v1goUdPII/MGxR/FJSBJYe183xuYzblEVIAVKl2HCfWoN3IXNvH+G4XOABm6oSwsZRR50UdLW+MI4fEFkjeLMv/Epx0vxpG7zxCo9M1ks9/5JDrFjjtFIqzpNV05vseIcwXgEP9ud/yX3Ltsl+zrRlXJ06NUv5B7Ky2h7BwBVZNgtay/aEImSJiR5RPqZAak0OQ+gjeM6Re0CWZ1MZoOgHCHV/N3OZ9yPBZQmgRK6Vfqle9vjS6gmZE9xYSX
X-Exchange-RoutingPolicyChecked:
	hU20FU5k/IyLaVKyJiCA9wRUXelOJ1TISP7+fmwO0hglCwXA+CcNSiIm5vx1fywBV464zUz2dipzPGuXVq/MPLooD7Lq1jyjhQMn8gG+Jo5cwh4hPj4CQATFTFCd2O1fZReL2bStmcjJTh1z5WxDLGtM06+S9fN2b+EOFgkM2q1I4KQJ1GX1Kef+rGSLKvWv8u6/n1pmV/VVFCJzPfbbW6hZ/Z114RUNP3eC/iyrISozE72WJ3Pk+nQ+/XFzR5EyxwFIGmn0/Q3/3Hg6vgcIKOUNCvnd+n2d/XMQEbHf4SDEZkGpG02LWZ5cB0X/291lP8mDBXZKSC6PvqywKl88eA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:38:52.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa226f7a-4d43-4689-abe4-08df3017e6c1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB6901
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX5Fvwc0bmM7rd
 Ul3pZmUNdb8tarbk4BgY7Fvksp+a8e5825rBEB3EgVL3tesZXaG5awqcAmalsHHb3BzrtpMFLHZ
 rvTDgjuJhLkPMQFLe/SE2AfTPhwQvopTZDFftilMkB5PuTMdTjvv0gUL702iMv1dCu+3kLk3Gle
 9f9ZoVQildlgEnWhsExx3PYV6wAbZQL7irv5AjR0pkwpo9MsWCXpu37EusVGklDH2v6vroRrzXY
 ORgWcnw+lCPrrbf3nEggRoIGEOpXkODohjZL4PhCApV41IUDzoF6Exy0IuUM0E0a9ZniSCz5Jfd
 mvQWrLrBLTrFufocDkE1myh7GssuqCtIp079js+WprjwYcy4+0o1D+VBaEWvcQ1VATHjn/Bo3QE
 ZZ4IweUmsnin47fxj0Wv14yKoQ/A1xJo9dMuBNqXtVyvha/BJdU0s7hKBCdR/Qx+21vCSnuHSh0
 Oz7zJYuUdqVE+DsupSQ==
X-Proofpoint-ORIG-GUID: j-l8XY3aG6cYfP89euZjqAymGJ4BvHTS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXzUiznl7gSsMk
 0lUqEFgPkx1alZKxVwXgopHk8l8RNderP/h/FOnrpQ0Byac/Py6/CkpX6nUibKoPgme7X5cJBbS
 5504Z9sKDV8dDv1NYs25bgLSLo4shhg=
X-Authority-Analysis: v=2.4 cv=e5GT2qp/ c=1 sm=1 tr=0 ts=6ad9cba2 cx=c_pps
 a=KF1eHXQEOlhFsAwOLvdZ7g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=hD80L64hAAAA:8 a=w1d2syhTAAAA:8 a=_KkEPjIi_RKE-pIIKSYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: j-l8XY3aG6cYfP89euZjqAymGJ4BvHTS
X-Proofpoint-Spam-Reason: safe

On Thu, Oct 22, 2026 at 09:59:36AM +0200, Marek Szyprowski wrote:
> The wm8994 regmap IRQ chip is registered with runtime_pm set, so
> regmap_irq_sync_unlock() calls pm_runtime_get_sync() on the wm8994
> device whenever an interrupt is requested or its mask is changed.
> However wm8994_device_init() enables runtime PM only after
> mfd_add_devices() has returned.
> 
> If the sound card is already waiting for the codec, it gets bound
> synchronously as soon as the wm8994-codec child registers its component,
> so the codec requests its interrupts from within mfd_add_devices(). At
> that point runtime PM is still disabled and pm_runtime_get_sync() fails
> with -EACCES, e.g. on Exynos4412 Trats2 board:
> 
>   wm8994 4-001a: IRQ sync failed to resume: -13
>   wm8994 4-001a: IRQ sync failed to resume: -13
>   ...
> 
> Fix this by enabling runtime PM before registering the IRQ chip and the
> child devices. Hold a usage reference while doing that, so the device
> is not runtime suspended before the probe completes, and drop it at the
> end, replacing the former pm_runtime_idle() call. Also disable runtime
> PM on the error path.
> 
> Fixes: 7a97637988c3 ("mfd: wm8994: Flag the interrupt block as requiring runtime PM be enabled")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This patch has been developed with LLM assistance and have been tested
> on the real Trats2 board.
> 
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
